-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_12_rom is 
    generic(
             DWIDTH     : integer := 32; 
             AWIDTH     : integer := 5; 
             MEM_SIZE    : integer := 32
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_12_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111110011101110011001110110000", 
    1 => "10111110100011011000010011001000", 
    2 => "10111100110100101011100110110100", 
    3 => "10111110100101000110000100001000", 
    4 => "00111110010111110010011111000100", 
    5 => "10111101010001101001100011111000", 
    6 => "00111110100000010000111010101001", 
    7 => "00111110010000100100011101001001", 
    8 => "10111110110101111010001100011110", 
    9 => "10111110100011101100100000110000", 
    10 => "00111110111100011010111111011010", 
    11 => "10111101011000100010010110010000", 
    12 => "10111110100111001110111100110101", 
    13 => "10111110101101100010011110111010", 
    14 => "10111111010101011100100100000101", 
    15 => "10111111000111010010010011101110", 
    16 => "10111110000111000000101110100100", 
    17 => "00111100110011101001010010000110", 
    18 => "00111110111000000110101011001101", 
    19 => "00111111001010000111100010100100", 
    20 => "00111100010101011101111010100000", 
    21 => "00111110000111101010010101100010", 
    22 => "10111110100101111001110001010111", 
    23 => "00111110100010001110110001111001", 
    24 => "00111110001111011101010110111001", 
    25 => "10111111010111110010110101110110", 
    26 => "00111101010100110100000111011000", 
    27 => "00111110000000000100111010011110", 
    28 => "00111110000101010110111010110000", 
    29 => "00111101010101010101011110001000", 
    30 => "00111111001011000111111100010111", 
    31 => "10111110110000100010011101100010" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity nn_inference_hwmm_layer2_layer2_weights_12 is
    generic (
        DataWidth : INTEGER := 32;
        AddressRange : INTEGER := 32;
        AddressWidth : INTEGER := 5);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of nn_inference_hwmm_layer2_layer2_weights_12 is
    component nn_inference_hwmm_layer2_layer2_weights_12_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_12_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_12_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


