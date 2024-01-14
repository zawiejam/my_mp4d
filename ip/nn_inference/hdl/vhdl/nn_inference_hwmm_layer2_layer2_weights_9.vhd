-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_9_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_9_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111110001000001001001010111010", 
    1 => "00111011100010000100111111000000", 
    2 => "10111101110010101101001010011001", 
    3 => "00111110011001000101111100010000", 
    4 => "00111110100101011111101100110101", 
    5 => "00111101000001110011000010110000", 
    6 => "00111101001111101010000011110111", 
    7 => "10111101111010101111011001011100", 
    8 => "00111110010011111111100011101111", 
    9 => "00111110000011111110110000100010", 
    10 => "10111110100110000100100011010110", 
    11 => "00111110011001111001000010011100", 
    12 => "00111110011010110001111101000100", 
    13 => "00111110000000010111010111001011", 
    14 => "10111110011101001100101000111110", 
    15 => "10111110101001101010100101000011", 
    16 => "10111110001001110110100000100000", 
    17 => "00111110100000000111110111110001", 
    18 => "10111110101011000000100001010010", 
    19 => "00111110100100101001011111100111", 
    20 => "00111110100000001001101111010000", 
    21 => "10111110001011100000001110100001", 
    22 => "00111101100000111011100001110000", 
    23 => "10111011011011000011010111011111", 
    24 => "00111110000101010110010110010000", 
    25 => "10111110011010001001110011001110", 
    26 => "10111101111010101100001110010100", 
    27 => "10111110100011001011000100000101", 
    28 => "10111100001110110100100010000000", 
    29 => "00111110011010001011001010110000", 
    30 => "00111110011100100001010001110101", 
    31 => "10111101111001011000110100100111" );


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

entity nn_inference_hwmm_layer2_layer2_weights_9 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_9 is
    component nn_inference_hwmm_layer2_layer2_weights_9_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_9_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_9_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


