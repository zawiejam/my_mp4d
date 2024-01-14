-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_17_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_17_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111110100011101001001110101010", 
    1 => "00111110000011110101100100100000", 
    2 => "00111101101011101100101011110101", 
    3 => "10111101101111110011010011010010", 
    4 => "10111101111111110011011100110101", 
    5 => "10111110011001101011001001111010", 
    6 => "10111101100001100100111110001010", 
    7 => "00111110011101010010110100001101", 
    8 => "10111110101100111000000100100010", 
    9 => "00111110000011110110011111010000", 
    10 => "00111110111011110001101100000101", 
    11 => "00111110100001010000110000101110", 
    12 => "00111101100101110111100011111100", 
    13 => "00111110110001001010011010101010", 
    14 => "00111110100110110111111110111011", 
    15 => "00111110011101010010010010011001", 
    16 => "10111110000100001000001110110101", 
    17 => "00111110000010100101111110011111", 
    18 => "10111110011111000110000110101100", 
    19 => "10111110110110101110011011000111", 
    20 => "00111110011100100110000001100000", 
    21 => "10111110000000100100110000000100", 
    22 => "10111110000110110010011000101010", 
    23 => "00111101011001011111011101001011", 
    24 => "10111101001001001001100110001001", 
    25 => "00111110100001110110000001011011", 
    26 => "00111110011101000101000101100100", 
    27 => "10111110100011100101011001000000", 
    28 => "00111100101110000010100111100000", 
    29 => "10111110010111000101000010100100", 
    30 => "00111100101001101100011100001101", 
    31 => "00111110101111000101010011001101" );


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

entity nn_inference_hwmm_layer2_layer2_weights_17 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_17 is
    component nn_inference_hwmm_layer2_layer2_weights_17_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_17_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_17_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


