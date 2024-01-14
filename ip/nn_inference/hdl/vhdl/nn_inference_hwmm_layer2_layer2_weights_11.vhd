-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_11_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_11_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111110001101101101010010000111", 
    1 => "00111101110110101101011001001000", 
    2 => "10111110100101010100011111000001", 
    3 => "00111110011100110000111011000100", 
    4 => "10111110000100101110001101101100", 
    5 => "00111110010110110001010100000100", 
    6 => "00111110111010111001010000111000", 
    7 => "10111110100010100111001010000101", 
    8 => "10111110010000110010001101101010", 
    9 => "10111101101101011000011101111110", 
    10 => "00111110111110001111000101011001", 
    11 => "00111110101001000011000100011000", 
    12 => "00111110001001110110001111000110", 
    13 => "10111101110001100110001110100010", 
    14 => "00111111001101110000111111100111", 
    15 => "00111111000001011010101001010000", 
    16 => "00111110011001011111010011011000", 
    17 => "10111110011101111101001010000011", 
    18 => "00111101101000111100111101011010", 
    19 => "10111111000110100100101101011110", 
    20 => "00111110101001110101101110101000", 
    21 => "00111110010111110001010001000000", 
    22 => "10111110010001101001111001000001", 
    23 => "00111101111010101111110010010101", 
    24 => "10111101010001111110001011100100", 
    25 => "10111011010001000010001001011101", 
    26 => "00111110010111011001100111100000", 
    27 => "00111110010010110110011100111111", 
    28 => "00111110100011100100011110111100", 
    29 => "00111110100111100101001110100100", 
    30 => "10111110101011011011111010100101", 
    31 => "00111100101111111000011011110110" );


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

entity nn_inference_hwmm_layer2_layer2_weights_11 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_11 is
    component nn_inference_hwmm_layer2_layer2_weights_11_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_11_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_11_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


