-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_2_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_2_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111110011001111100111010001001", 
    1 => "10111101100101001100000000100100", 
    2 => "10111101011011111111010101110000", 
    3 => "00111110000100111101100101010110", 
    4 => "00111101100000001110011100101010", 
    5 => "10111110011001111011111000000110", 
    6 => "10111110001010100011000100000011", 
    7 => "10111101110010011010000011001010", 
    8 => "10111110000100001111010000011001", 
    9 => "00111110001111001000100000111000", 
    10 => "10111110011011001100010101111010", 
    11 => "10111110101001000000011101000010", 
    12 => "00111110000110000010100001111001", 
    13 => "00111110100010000011000011011111", 
    14 => "10111110100010000111011101100010", 
    15 => "00111110100011010110011110100000", 
    16 => "10111110001101100111101101101001", 
    17 => "00111101001110010100011001001110", 
    18 => "10111110010001110111101011111001", 
    19 => "00111101100001011110110110111110", 
    20 => "00111010101100111001101000000000", 
    21 => "10111110100001110011100101001100", 
    22 => "10111110100101010000111110010001", 
    23 => "10111110010111100101000111001000", 
    24 => "00111110100010110111010110010100", 
    25 => "10111110100010000111111010101101", 
    26 => "00111101111111101111110101110000", 
    27 => "10111110001100000101101010010011", 
    28 => "10111101100001011100111111111100", 
    29 => "10111110001010100111101111000001", 
    30 => "10111110000101111000000011100111", 
    31 => "00111110001000011010000101001011" );


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

entity nn_inference_hwmm_layer2_layer2_weights_2 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_2 is
    component nn_inference_hwmm_layer2_layer2_weights_2_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_2_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_2_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


