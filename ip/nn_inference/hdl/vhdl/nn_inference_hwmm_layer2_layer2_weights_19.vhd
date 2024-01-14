-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_19_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_19_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111101100000111011010001111000", 
    1 => "00111110100000001110010110111100", 
    2 => "10111110101010000110011100111001", 
    3 => "10111110101001111000100100111111", 
    4 => "00111110001100111101010100011000", 
    5 => "00111110010101110010011111011100", 
    6 => "10111110000100110100010001000111", 
    7 => "00111101100010000000110111010100", 
    8 => "00111110101001000100101111001011", 
    9 => "10111101000101100110001110110000", 
    10 => "10111110000011010101101110111110", 
    11 => "00111110000100111011101110110000", 
    12 => "10111101101101110010011110011010", 
    13 => "10111110001000001101101101111000", 
    14 => "00111111001001111011000101111000", 
    15 => "10111110100111001001111111100100", 
    16 => "00111110010100110101011111011100", 
    17 => "00111101111101110101010001110001", 
    18 => "00111110100010000001001000010111", 
    19 => "10111111100011111110111111000000", 
    20 => "00111101000000000011001010001000", 
    21 => "00111110001101000000111011101000", 
    22 => "10111110000100000110010011110000", 
    23 => "00111100011000010010110011100000", 
    24 => "00111101010001100100000001101011", 
    25 => "10111110001101010111010110000101", 
    26 => "10111110100100111100111000111010", 
    27 => "10111110010010101000101110101011", 
    28 => "10111010101101010111010000000000", 
    29 => "10111110010001000001000010100101", 
    30 => "00111101111011010000001011111000", 
    31 => "10111110001001101010100010110010" );


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

entity nn_inference_hwmm_layer2_layer2_weights_19 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_19 is
    component nn_inference_hwmm_layer2_layer2_weights_19_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_19_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_19_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


