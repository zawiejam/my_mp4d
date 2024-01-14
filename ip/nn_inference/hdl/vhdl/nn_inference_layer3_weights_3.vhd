-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_layer3_weights_3_rom is 
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


architecture rtl of nn_inference_layer3_weights_3_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111111011011000110000110011111", 
    1 => "00111111000010011101000011101011", 
    2 => "10111110110011000110110110000111", 
    3 => "10111111101100001001011101101000", 
    4 => "10111111001000111011001101101001", 
    5 => "00111111001101100011001111001101", 
    6 => "10111110101010011110010010101010", 
    7 => "10111111000011100111001011111110", 
    8 => "00111110111111111111101011110110", 
    9 => "00111110110100100011001001101001", 
    10 => "00111110001000001011010100001110", 
    11 => "00111110001010111100011101000110", 
    12 => "00111110001010010000100011001000", 
    13 => "00111101111001011010101100110001", 
    14 => "10111110010011100111011000110101", 
    15 => "00111101110110010011100010001000", 
    16 => "00111110111100010111100110100111", 
    17 => "10111101001010101000001001001100", 
    18 => "10111110000110100001000100101001", 
    19 => "00111110100111101111101101011111", 
    20 => "00111111001011001100111101000001", 
    21 => "10111110100110111011001000011111", 
    22 => "00111110101000111111011000001000", 
    23 => "10111100101011010001000010001110" );


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

entity nn_inference_layer3_weights_3 is
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

architecture arch of nn_inference_layer3_weights_3 is
    component nn_inference_layer3_weights_3_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_layer3_weights_3_rom_U :  component nn_inference_layer3_weights_3_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


