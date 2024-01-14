-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_16_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_16_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111110010100001111011101011010", 
    1 => "10111101110010001010101100110100", 
    2 => "10111110100100001110011100100010", 
    3 => "10111110011101101011100100110001", 
    4 => "10111110101000010011000101011110", 
    5 => "10111110100000011001010001011011", 
    6 => "00111110011011010101100000100101", 
    7 => "00111110000101001010000011100010", 
    8 => "10111110000001111110111111110011", 
    9 => "10111110000101110111110001000000", 
    10 => "00111100110000011100110010011000", 
    11 => "10111101100011111100010110011100", 
    12 => "10111101010100100101111110000000", 
    13 => "10111110011001001111110101111010", 
    14 => "00111101101110111010101010100011", 
    15 => "10111110110101010000101100110011", 
    16 => "00111110011000110011111000101000", 
    17 => "10111101111100101110111111101000", 
    18 => "00111110100010110100101111001111", 
    19 => "10111110010001110101110110001011", 
    20 => "10111101101101001011110100110100", 
    21 => "10111110001100011010111001101100", 
    22 => "00111110100100101101010010101110", 
    23 => "10111101011111101000011100010000", 
    24 => "00111101101010011001110000110110", 
    25 => "00111111100010001110101110011000", 
    26 => "10111110011011101100110110000110", 
    27 => "10111101100001111011010100110011", 
    28 => "00111110010000111010110111111000", 
    29 => "00111101000011000001101111101000", 
    30 => "10111110101001101110011010111011", 
    31 => "10111110110101011111111001011111" );


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

entity nn_inference_hwmm_layer2_layer2_weights_16 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_16 is
    component nn_inference_hwmm_layer2_layer2_weights_16_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_16_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_16_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


