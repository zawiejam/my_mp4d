-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_21_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_21_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111110001001000010110001111011", 
    1 => "00111100011001100101111100100000", 
    2 => "00111101100100110001100100100000", 
    3 => "10111100000101010001011010100000", 
    4 => "10111100111001101101010011000011", 
    5 => "00111110100110000111011110101110", 
    6 => "10111100101100100100001001000111", 
    7 => "10111110011010000100100000011000", 
    8 => "00111101001110001000010000000100", 
    9 => "10111101000001000101110000100000", 
    10 => "10111110000111100001000100000000", 
    11 => "00111110001011110101101001100110", 
    12 => "10111110100011101110111110101010", 
    13 => "10111101110101011100000011011010", 
    14 => "10111011100011010100011000111111", 
    15 => "10111110001010001100111111111010", 
    16 => "00111101001100010100011111110000", 
    17 => "00111110101000011001111001011100", 
    18 => "10111110100110011101101100110111", 
    19 => "00111110011101100000100001110100", 
    20 => "00111110000100100101101001101100", 
    21 => "10111110001111111110001110011000", 
    22 => "10111110010010111100111111000001", 
    23 => "00111101110111111100110111011011", 
    24 => "00111101101001000001110011110111", 
    25 => "10111101101111010000010100000100", 
    26 => "10111110010000011001100111111000", 
    27 => "00111110101001000100101101100100", 
    28 => "00111101101101011010110110001100", 
    29 => "00111110100000101010000110010000", 
    30 => "10111101111110111011000100101011", 
    31 => "00111110101000100110111111001111" );


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

entity nn_inference_hwmm_layer2_layer2_weights_21 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_21 is
    component nn_inference_hwmm_layer2_layer2_weights_21_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_21_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_21_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


