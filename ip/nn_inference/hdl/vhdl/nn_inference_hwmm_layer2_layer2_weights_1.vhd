-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_1_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_1_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111100100011000110010111110000", 
    1 => "10111110010001100011110110111100", 
    2 => "10111111000001110101001110000011", 
    3 => "10111110100001111010001101010000", 
    4 => "00111101100001111100001110110011", 
    5 => "10111110010000111010011111100110", 
    6 => "00111101100001000001001001011011", 
    7 => "00111110001001010110000101001101", 
    8 => "10111110101001011110011001100001", 
    9 => "00111110001001110010011010100100", 
    10 => "00111110100010100110000101010011", 
    11 => "00111101011111001011001000011000", 
    12 => "00111110011110111000110010110010", 
    13 => "00111101100110100011111010111010", 
    14 => "10111111100010011100011100000110", 
    15 => "00111101001111111001010010100000", 
    16 => "00111110000110110001001110100010", 
    17 => "10111110100111110101001000100011", 
    18 => "00111110100010110100010100111100", 
    19 => "00111110100010111110000000110110", 
    20 => "00111110000001001000011001011100", 
    21 => "00111110001001001001011100011100", 
    22 => "00111100101010111010101010010000", 
    23 => "10111110100101000100110101111000", 
    24 => "00111101110000111101110101011101", 
    25 => "10111110111011011011111110010010", 
    26 => "00111110001011110110011101011010", 
    27 => "00111110011110011111111111010001", 
    28 => "00111110001001001110100001110010", 
    29 => "10111101100101011011001001011100", 
    30 => "00111111001101100100011111100111", 
    31 => "10111110000011111011000001001111" );


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

entity nn_inference_hwmm_layer2_layer2_weights_1 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_1 is
    component nn_inference_hwmm_layer2_layer2_weights_1_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_1_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_1_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


