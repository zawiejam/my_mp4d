-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_layer3_weights_0_rom is 
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


architecture rtl of nn_inference_layer3_weights_0_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111110111010011011001010010011", 
    1 => "00111110110010111100100011111011", 
    2 => "00111110110100000111101011110101", 
    3 => "00111111000010011000111001111100", 
    4 => "00111110100100111011101001010001", 
    5 => "10111111000101111000011010101001", 
    6 => "10111111100001100010110100101100", 
    7 => "00111110010000101100111110110100", 
    8 => "10111110111110101101001110000010", 
    9 => "00111011001100001011111110010100", 
    10 => "10111110011110101111101011101110", 
    11 => "10111110001100101011011111011011", 
    12 => "00111111010110000011101110111010", 
    13 => "00111110100011010100100010100000", 
    14 => "10111110110110100110010101010101", 
    15 => "10111101111000100100011100100110", 
    16 => "10111111101111011101011110111001", 
    17 => "10111101101010101111011010010101", 
    18 => "10111110101000100100001111011110", 
    19 => "00111111010001110101101100110001", 
    20 => "10111100100100010000011111100110", 
    21 => "00111110100101110001001111001110", 
    22 => "00111110101110111100100000010011", 
    23 => "00111110100000100011000110011010" );


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

entity nn_inference_layer3_weights_0 is
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

architecture arch of nn_inference_layer3_weights_0 is
    component nn_inference_layer3_weights_0_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_layer3_weights_0_rom_U :  component nn_inference_layer3_weights_0_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


