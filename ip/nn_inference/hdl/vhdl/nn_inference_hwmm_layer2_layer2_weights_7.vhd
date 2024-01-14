-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_7_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_7_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111110011010010011010001101000", 
    1 => "00111110000101101010100110111110", 
    2 => "00111101101110010001000100111000", 
    3 => "10111110001000111001100110110010", 
    4 => "10111011100111000110011101000111", 
    5 => "00111110010111101011001111010100", 
    6 => "00111110100011100011010000000100", 
    7 => "10111101000001001110110011111101", 
    8 => "10111101101010101111111011011010", 
    9 => "10111110100001101000001100010111", 
    10 => "00111110000000011001000111001110", 
    11 => "00111101101010000001010100111100", 
    12 => "00111110001011111010110001110011", 
    13 => "00111110100000010001110010101010", 
    14 => "10111111010100001110101100100111", 
    15 => "10111110111111110111010001011101", 
    16 => "10111110001001111100111000010001", 
    17 => "00111101010011000110000111100000", 
    18 => "00111110100100100001111110101111", 
    19 => "00111110101011100111101011110011", 
    20 => "10111110010000010110110010111100", 
    21 => "00111110011100011101101111101100", 
    22 => "00111101100010100111001100110000", 
    23 => "00111110010100100000101100001110", 
    24 => "10111101010000110011000000000100", 
    25 => "00111100110100010010100000001010", 
    26 => "10111110000001000010010101111111", 
    27 => "00111101000110110011011001000110", 
    28 => "00111110010011111111111100001100", 
    29 => "10111110010001100111100101011111", 
    30 => "10111101110111010110011011101001", 
    31 => "00111110100111101011011000001010" );


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

entity nn_inference_hwmm_layer2_layer2_weights_7 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_7 is
    component nn_inference_hwmm_layer2_layer2_weights_7_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_7_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_7_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


