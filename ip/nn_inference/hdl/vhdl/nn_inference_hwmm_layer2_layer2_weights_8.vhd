-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_8_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_8_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111101100100000011110111010100", 
    1 => "10111110100010000000111011010100", 
    2 => "10111101101111010100010101011010", 
    3 => "10111100101101000101110110110000", 
    4 => "00111110010000100110011011000011", 
    5 => "00111110100001011100100010111110", 
    6 => "00111110011111011110011111111100", 
    7 => "00111101010111100000001100001011", 
    8 => "10111110000001100010010110011110", 
    9 => "10111110100101011100100011000011", 
    10 => "10111110000111000100111001101111", 
    11 => "00111110100001100000000100000000", 
    12 => "10111110000101101011011100010011", 
    13 => "00111110100000111011101010110001", 
    14 => "00111110110111100101111010100101", 
    15 => "00111110101111101100010110001100", 
    16 => "00111110101000111111111000100110", 
    17 => "10111110100110010101001110100101", 
    18 => "00111101000011010011110110010110", 
    19 => "10111110111000110100110010011111", 
    20 => "10111110011010111011000011011111", 
    21 => "10111110001110110010011000000011", 
    22 => "10111110100100111000110011111111", 
    23 => "10111100011111010010111010011111", 
    24 => "00111110010011100100110111000000", 
    25 => "00111110110110010010010010100011", 
    26 => "00111101100100011101010011000100", 
    27 => "00111101110100001100001001101001", 
    28 => "00111110001110101011101000000100", 
    29 => "10111110011011101001100100100010", 
    30 => "00111110100111010010011100000000", 
    31 => "10111110100000100000100100111001" );


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

entity nn_inference_hwmm_layer2_layer2_weights_8 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_8 is
    component nn_inference_hwmm_layer2_layer2_weights_8_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_8_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_8_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


