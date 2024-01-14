-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_3_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_3_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111101111100001001000100001000", 
    1 => "10111110010100110110011110000110", 
    2 => "10111010111101001010010101100110", 
    3 => "00111100101101000010101100000000", 
    4 => "10111110001011000110100111110101", 
    5 => "10111100101100001100000101010000", 
    6 => "00111110011111010000000101111001", 
    7 => "00111110001000001110100110010110", 
    8 => "10111101100001101111111100101010", 
    9 => "00111101100101100011011001010000", 
    10 => "10111100000000011100011011101011", 
    11 => "00111101101100010100101101101100", 
    12 => "00111110100101111001101001110101", 
    13 => "00111110000110000101110001010110", 
    14 => "00111101110101110010100100000011", 
    15 => "10111110110010001111010100101001", 
    16 => "00111110011010111011110001101000", 
    17 => "10111110010110000011011010100100", 
    18 => "10111101010000110010010010011010", 
    19 => "10111111000110001001110010110111", 
    20 => "10111110000010010011010000010010", 
    21 => "00111101101011111110111001000000", 
    22 => "00111110011010110101011101111100", 
    23 => "10111110010001001110011011100111", 
    24 => "00111110010011110100101110111011", 
    25 => "10111110000100001010000010101110", 
    26 => "10111110101001100010001000111110", 
    27 => "10111101110100110011100100010110", 
    28 => "10111110001101100110111111000101", 
    29 => "00111101111010000100010010100100", 
    30 => "10111111001001010111111001101100", 
    31 => "00111110100110110101111110001001" );


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

entity nn_inference_hwmm_layer2_layer2_weights_3 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_3 is
    component nn_inference_hwmm_layer2_layer2_weights_3_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_3_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_3_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


