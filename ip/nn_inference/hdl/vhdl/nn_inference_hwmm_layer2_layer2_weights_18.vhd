-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_18_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_18_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111101101000100101100000010100", 
    1 => "00111110100010101100100001011100", 
    2 => "10111110011101100101111001101000", 
    3 => "00111110011011001101000011111100", 
    4 => "10111110001001100110011101011100", 
    5 => "10111110100111100010101101001101", 
    6 => "10111101101011110000001110110011", 
    7 => "00111110001101001100010111011100", 
    8 => "00111010100100001100010001001011", 
    9 => "00111100110101101101010010000000", 
    10 => "00111110010111011000111000100011", 
    11 => "00111110100100010110110101011000", 
    12 => "10111110010000001110111001001001", 
    13 => "00111101111110110100011000011011", 
    14 => "10111110000100111100011101111001", 
    15 => "10111110010000100100001100111110", 
    16 => "10111101010010010000001000101000", 
    17 => "10111110000011110100001111100101", 
    18 => "00111110001001100010010111011011", 
    19 => "10111100110110100101101010001010", 
    20 => "00111110001100010000110010110100", 
    21 => "00111110100110110100101010111010", 
    22 => "10111101001110000101001100001000", 
    23 => "10111110100101000100010110010110", 
    24 => "10111110001000100010110101011000", 
    25 => "10111110100011010101100110101010", 
    26 => "10111110000100000110110011100101", 
    27 => "10111110010010000110111011100110", 
    28 => "00111110100001110011100111110110", 
    29 => "00111101111101000110011011011000", 
    30 => "10111110101011001000001000110110", 
    31 => "10111101101011000110001111111101" );


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

entity nn_inference_hwmm_layer2_layer2_weights_18 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_18 is
    component nn_inference_hwmm_layer2_layer2_weights_18_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_18_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_18_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


