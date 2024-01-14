-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_14_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_14_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111110100001101001101011000101", 
    1 => "10111110100000110110110011010101", 
    2 => "10111110101000000001010001011001", 
    3 => "00111101010000011100100111111000", 
    4 => "00111110001001011111011111110010", 
    5 => "00111101000100100111110010011000", 
    6 => "10111110101001001001110110001000", 
    7 => "00111101101011110000100100110100", 
    8 => "00111110011100110001010000010011", 
    9 => "00111100100101111101101000100000", 
    10 => "00111101110010110110010100011111", 
    11 => "00111101010010010111101001001000", 
    12 => "00111110001001011001001111001000", 
    13 => "10111101100111100101011100010100", 
    14 => "00111110000011101010011011011001", 
    15 => "00111110100011110111110111001101", 
    16 => "00111101111010111100011010101000", 
    17 => "10111101101011100001001110000001", 
    18 => "10111110100101010011000010101000", 
    19 => "00111110000100010101101011010011", 
    20 => "10111101011110111100010010100000", 
    21 => "10111110100001011000010100001000", 
    22 => "10111110011111010010011000110001", 
    23 => "00111110100110001100010110111100", 
    24 => "10111110011001001101101101000110", 
    25 => "10111110011001001000011110010011", 
    26 => "10111110100010100000101001101100", 
    27 => "10111110010101000101101011000101", 
    28 => "10111101101010111001010111101010", 
    29 => "00111101101101001111011100111000", 
    30 => "10111101110111101001010100001111", 
    31 => "10111110101000110001100000100101" );


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

entity nn_inference_hwmm_layer2_layer2_weights_14 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_14 is
    component nn_inference_hwmm_layer2_layer2_weights_14_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_14_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_14_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


