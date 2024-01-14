-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_13_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_13_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111110011000101100000111000000", 
    1 => "00111100001000010110110100000000", 
    2 => "10111110100001111101111000111111", 
    3 => "10111110101001100100010101001100", 
    4 => "00111110001100001001111111101110", 
    5 => "10111101000101100110010111101000", 
    6 => "00111110010111110101111001101001", 
    7 => "00111110010011011101000011100000", 
    8 => "10111110000011101011110101101001", 
    9 => "10111110011100000111011010000100", 
    10 => "00111011101000010110101011110010", 
    11 => "00111110001010010011111001101010", 
    12 => "10111011011011011010011010000000", 
    13 => "10111101101111100001001111100000", 
    14 => "10111100100111100101011101010000", 
    15 => "10111101110001100110000001000100", 
    16 => "00111110000111010111101001100100", 
    17 => "00111101101100100010001011100100", 
    18 => "10111110001010001100101010101011", 
    19 => "10111101000011001011001111110110", 
    20 => "10111101001011010110011111101000", 
    21 => "00111110010111110110110000010000", 
    22 => "00111101100100110111011110001100", 
    23 => "00111110001111110010001110011000", 
    24 => "00111101110110010000000010010000", 
    25 => "10111110100111001010000001100111", 
    26 => "00111101110111011111001001101100", 
    27 => "00111101001011001000110110000000", 
    28 => "10111110100100110101101010001100", 
    29 => "00111110100101111011101101000000", 
    30 => "10111110100100101110100001111101", 
    31 => "10111110001110001010101111000000" );


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

entity nn_inference_hwmm_layer2_layer2_weights_13 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_13 is
    component nn_inference_hwmm_layer2_layer2_weights_13_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_13_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_13_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


