-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_10_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_10_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111110100111000010110011010011", 
    1 => "10111110001001111100011001000110", 
    2 => "10111101101010001111010100000010", 
    3 => "10111110011001110001010100110100", 
    4 => "10111101111001111101010011011101", 
    5 => "10111100111110011010010010100000", 
    6 => "10111110111001001101010011011111", 
    7 => "00111110010100001010100011111100", 
    8 => "00111110100010000001000011101111", 
    9 => "10111100011001000100101010100000", 
    10 => "00111100101010011011110011111001", 
    11 => "10111110100110100111100100010101", 
    12 => "10111101011010100011001000000110", 
    13 => "00111100101111101011000110100100", 
    14 => "10111110100010111110001000000011", 
    15 => "00111110100111011010101001111100", 
    16 => "10111110010000001000111001010001", 
    17 => "10111101110110101111110011000000", 
    18 => "00111110001010000110010000110001", 
    19 => "00111110011111010101000000110110", 
    20 => "10111101110011001111001101011000", 
    21 => "10111101110000111100110000000010", 
    22 => "10111110100000110110000111000001", 
    23 => "10111100001010101110010010101101", 
    24 => "00111110101010011101111101101111", 
    25 => "10111111000000011110111111001011", 
    26 => "10111110100110100011011000001101", 
    27 => "00111101111011010001011110110110", 
    28 => "10111101111001011010011110111110", 
    29 => "10111101101011011010010101000110", 
    30 => "00111110101101111001000111100001", 
    31 => "00111101010000011001001111001011" );


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

entity nn_inference_hwmm_layer2_layer2_weights_10 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_10 is
    component nn_inference_hwmm_layer2_layer2_weights_10_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_10_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_10_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


