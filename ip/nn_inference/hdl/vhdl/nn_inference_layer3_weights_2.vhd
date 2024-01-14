-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_layer3_weights_2_rom is 
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


architecture rtl of nn_inference_layer3_weights_2_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111110010100001010111010110000", 
    1 => "10111111100010001011110000010000", 
    2 => "10111101000010110100101011001101", 
    3 => "00111111001101010001101110101000", 
    4 => "00111111010010010000100000010100", 
    5 => "10111110010110001100111010101000", 
    6 => "00111111000101001101101000011011", 
    7 => "00111101111000110011111001011000", 
    8 => "10111101111100101010000110100000", 
    9 => "10111110001010110010110100101001", 
    10 => "00111111000111111110100100010001", 
    11 => "10111111000111101010101100110010", 
    12 => "10111111011101111100000010000000", 
    13 => "10111110011100000000101011111011", 
    14 => "00111110111000000101111001111100", 
    15 => "10111111010100111100110010100000", 
    16 => "00111111000101110010110101101010", 
    17 => "00111110110001101111011111010100", 
    18 => "00111110010011111101111100011111", 
    19 => "10111111100111110111010100101110", 
    20 => "00111111000001111010110010011101", 
    21 => "10111110010111000001011010010001", 
    22 => "00111110010100011101101100011000", 
    23 => "00111110010011111011001011110110" );


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

entity nn_inference_layer3_weights_2 is
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

architecture arch of nn_inference_layer3_weights_2 is
    component nn_inference_layer3_weights_2_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_layer3_weights_2_rom_U :  component nn_inference_layer3_weights_2_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


