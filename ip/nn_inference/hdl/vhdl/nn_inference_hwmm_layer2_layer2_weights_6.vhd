-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_6_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_6_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111110001010111111010010011100", 
    1 => "00111101101111111110110111111000", 
    2 => "00111110000011011010001001100001", 
    3 => "00111110001101100011101110111000", 
    4 => "10111101101010110010011001100010", 
    5 => "10111011111100010000001101000000", 
    6 => "10111110011100001111100111010110", 
    7 => "10111110100111110101111001000010", 
    8 => "10111110000001101000100110001010", 
    9 => "10111101100100010001111010110100", 
    10 => "00111110111000000010110110001101", 
    11 => "10111110001111010000011111110000", 
    12 => "00111100000110001110000011111001", 
    13 => "00111110110110011010000000010111", 
    14 => "00111110101001100001001110100111", 
    15 => "00111110000101001011000011011111", 
    16 => "10111101111110011111101011101110", 
    17 => "10111101000101000100111000100011", 
    18 => "00111101000011000011110111110001", 
    19 => "10111111001011001110101001111001", 
    20 => "00111100000001100001100001100000", 
    21 => "00111110010000010110111000110000", 
    22 => "10111110011000110011010000101110", 
    23 => "10111110010001101111110101001111", 
    24 => "00111110001111011001110110011011", 
    25 => "00111110111100010110010010001011", 
    26 => "00111110001100101110010111100100", 
    27 => "10111110100001000001001110101110", 
    28 => "00111110100010110101101000010000", 
    29 => "10111110011110010100100000101100", 
    30 => "10111110101101111010000110010101", 
    31 => "00111110110110011000001001010100" );


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

entity nn_inference_hwmm_layer2_layer2_weights_6 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_6 is
    component nn_inference_hwmm_layer2_layer2_weights_6_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_6_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_6_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


