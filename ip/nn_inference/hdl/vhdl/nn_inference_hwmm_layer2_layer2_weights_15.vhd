-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_15_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_15_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111101111001001101010010001010", 
    1 => "10111101110101111110000011000010", 
    2 => "10111101000110011101100100110000", 
    3 => "00111101110000111100101001101000", 
    4 => "00111110100110010110100111110110", 
    5 => "00111110100001110100110100100010", 
    6 => "00111110111110000000110101011101", 
    7 => "10111101010110001001100000010000", 
    8 => "10111011100100011101011000101110", 
    9 => "10111110100000100010101101100101", 
    10 => "00111110100101001011001110101111", 
    11 => "10111110001011110110111100110101", 
    12 => "10111110011111010100000000000111", 
    13 => "10111101001111100111011100111101", 
    14 => "00111110110111010001011100101101", 
    15 => "00111110110110111001101110000101", 
    16 => "00111110100010110101001011011010", 
    17 => "10111110010101001101111011101100", 
    18 => "10111110000011001101001101111100", 
    19 => "10111110100101010010001111100100", 
    20 => "00111110011110011101010000100100", 
    21 => "10111110001001111000001001101111", 
    22 => "00111110010011010100000111001000", 
    23 => "10111101110001010110010100110010", 
    24 => "00111110010101100000001001000100", 
    25 => "10111110001011110011101101000011", 
    26 => "00111101110000111111010100100000", 
    27 => "00111101111110110101110011110000", 
    28 => "10111110100100110100000101110010", 
    29 => "10111101101010101101011100111110", 
    30 => "10111110001000000100100110111010", 
    31 => "10111110111010001010100011101110" );


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

entity nn_inference_hwmm_layer2_layer2_weights_15 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_15 is
    component nn_inference_hwmm_layer2_layer2_weights_15_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_15_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_15_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


