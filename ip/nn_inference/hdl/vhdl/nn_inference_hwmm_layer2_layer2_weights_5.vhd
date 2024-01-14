-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_5_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_5_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111110100111010000010000001010", 
    1 => "10111101111110000100010111110100", 
    2 => "10111110100001000000101110011110", 
    3 => "10111110101001000001010011100010", 
    4 => "00111101101010011111101010100010", 
    5 => "00111100010001100010111001100000", 
    6 => "00111110100111101001011001111000", 
    7 => "10111101100000010000100110010101", 
    8 => "00111110011000111100000111011110", 
    9 => "10111110101000000111011110010111", 
    10 => "00111101111100101100001000001011", 
    11 => "10111010011111011110100000000000", 
    12 => "10111110100011000110100001001010", 
    13 => "00111110100100011101111001110110", 
    14 => "00111111010110111000001111000100", 
    15 => "00111111001101011111101011011111", 
    16 => "10111100110101000101010110110000", 
    17 => "00111110100010010110101110111011", 
    18 => "10111110100100101011101110001001", 
    19 => "10111110110110111001111011101100", 
    20 => "10111110000111001001111001110011", 
    21 => "00111101101110001110011101111000", 
    22 => "00111110011100110001111100111100", 
    23 => "00111110101000001001101011111111", 
    24 => "00111110011010101011001111101010", 
    25 => "00111110100111011111101111110000", 
    26 => "10111110011100110011011111101000", 
    27 => "00111110100011100110010111101001", 
    28 => "00111101111000011011100011100100", 
    29 => "00111011100011110000010001000000", 
    30 => "10111100111001101100101010101001", 
    31 => "10111110100011101100000101000000" );


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

entity nn_inference_hwmm_layer2_layer2_weights_5 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_5 is
    component nn_inference_hwmm_layer2_layer2_weights_5_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_5_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_5_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


