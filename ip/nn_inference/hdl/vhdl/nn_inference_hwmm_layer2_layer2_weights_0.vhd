-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_0_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_0_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111110010001110100100010111011", 
    1 => "00111101111011101010010110101100", 
    2 => "00111110110010111001101101000101", 
    3 => "10111010111101001011101000000000", 
    4 => "00111110001110101001101100111100", 
    5 => "00111110100111110101000010111010", 
    6 => "00111110101001100111010110100100", 
    7 => "00111110001010011000001011110000", 
    8 => "10111110111110011111110001100111", 
    9 => "10111101011111110001000111110000", 
    10 => "10111101111110010001111011100111", 
    11 => "10111100110100010111011000000000", 
    12 => "10111110000010000101101110011110", 
    13 => "10111100101110110011111101000111", 
    14 => "00111111010100110011010001110111", 
    15 => "10111110100001000000101100101101", 
    16 => "10111110001100100011001111000100", 
    17 => "10111110101000011100100010111101", 
    18 => "10111110001000000101001011011100", 
    19 => "00111111000001000010111100000000", 
    20 => "10111110000101011001011110111111", 
    21 => "10111110100001001001100110010010", 
    22 => "10111101111110110101001111110000", 
    23 => "10111101011100110111101101111000", 
    24 => "00111110010100001010010000111000", 
    25 => "10111110101010111111001010100101", 
    26 => "10111110001010010101011111010111", 
    27 => "00111110100101110100010111101100", 
    28 => "00111100100001110110110101010000", 
    29 => "00111001110001001000010000000000", 
    30 => "10111110100100110110101100011110", 
    31 => "00111110100101011011100111110101" );


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

entity nn_inference_hwmm_layer2_layer2_weights_0 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_0 is
    component nn_inference_hwmm_layer2_layer2_weights_0_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_0_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_0_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


