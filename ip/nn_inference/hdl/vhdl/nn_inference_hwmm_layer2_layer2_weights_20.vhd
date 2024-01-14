-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_20_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_20_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111101000110011001111101011000", 
    1 => "00111110100111010010000001101010", 
    2 => "10111110011011110010000100110110", 
    3 => "10111110001100101110010000001000", 
    4 => "10111101100011010010110101011110", 
    5 => "10111100100010000001011111100000", 
    6 => "10111110010110010000111000111000", 
    7 => "00111101110101101110001110110010", 
    8 => "00111110110011111111001001011001", 
    9 => "00111110001100100111111100000100", 
    10 => "10111110011010100110010111111101", 
    11 => "00111110101001010101101001101110", 
    12 => "00111110100010001000100101110110", 
    13 => "00111110100101110001110110101011", 
    14 => "10111110011100101100011011101000", 
    15 => "00111110000111110011110011000010", 
    16 => "00111101011001101100101000000000", 
    17 => "10111110001000110111011000110101", 
    18 => "00111101111000100010000011011000", 
    19 => "00111110110111000001010000001010", 
    20 => "10111110101001101011100011000000", 
    21 => "00111110100110101100101001011000", 
    22 => "00111110100001011011101111110010", 
    23 => "10111101110110010011100111101101", 
    24 => "10111110100010000000000110010111", 
    25 => "10111010011101111111111001011100", 
    26 => "10111101100111100000011111000000", 
    27 => "00111101110000011010101101011010", 
    28 => "10111101111011010011011110111000", 
    29 => "10111110011110100010011000101001", 
    30 => "00111110111110111011101101101000", 
    31 => "00111110110110011011101100011100" );


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

entity nn_inference_hwmm_layer2_layer2_weights_20 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_20 is
    component nn_inference_hwmm_layer2_layer2_weights_20_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_20_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_20_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


