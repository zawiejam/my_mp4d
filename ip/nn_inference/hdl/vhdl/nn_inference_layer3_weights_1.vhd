-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_layer3_weights_1_rom is 
    generic(
             DWIDTH     : integer := 32; 
             AWIDTH     : integer := 5; 
             MEM_SIZE    : integer := 24
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of nn_inference_layer3_weights_1_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111111100010111001011100011110", 
    1 => "10111111001001111001111001000100", 
    2 => "10111110100100001111100110111110", 
    3 => "00111111100011101001100000100101", 
    4 => "10111111011110100000100101010110", 
    5 => "00111111000101000000010010000111", 
    6 => "00111111010001010011100100010010", 
    7 => "10111110100100001000111000011001", 
    8 => "10111101100011001010010110100011", 
    9 => "10111001011011100000111000110011", 
    10 => "10111111100010100101010001001111", 
    11 => "00111111001001100001001110011010", 
    12 => "10111110010100100000001001001100", 
    13 => "00111100001011001111100001000101", 
    14 => "10111101001001011000001000111100", 
    15 => "00111110111111111000110011000111", 
    16 => "10111101100011011100001110110011", 
    17 => "00111111010100111101010000001111", 
    18 => "10111110100110001000110100101000", 
    19 => "00111110010101000000011110111000", 
    20 => "10111111001001101101000111101000", 
    21 => "10111101111110010101100110110110", 
    22 => "00111110001100011101001101101100", 
    23 => "00111110010100111001111010010101" );


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

entity nn_inference_layer3_weights_1 is
    generic (
        DataWidth : INTEGER := 32;
        AddressRange : INTEGER := 24;
        AddressWidth : INTEGER := 5);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of nn_inference_layer3_weights_1 is
    component nn_inference_layer3_weights_1_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_layer3_weights_1_rom_U :  component nn_inference_layer3_weights_1_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


