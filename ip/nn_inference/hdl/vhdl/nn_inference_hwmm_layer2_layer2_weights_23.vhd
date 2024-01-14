-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_23_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_23_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111100010010011101100011000000", 
    1 => "10111110001001100110010000000110", 
    2 => "00111100001111111101110001000010", 
    3 => "00111110001100100000010111001100", 
    4 => "00111101000101110000010110100010", 
    5 => "10111101111110101000110101111110", 
    6 => "10111101110101110000101110101110", 
    7 => "10111101001101101000011011100001", 
    8 => "10111110011011101101011000110010", 
    9 => "10111110011000000110001011010101", 
    10 => "10111101000110110001001010010001", 
    11 => "00111110011001000100010001110000", 
    12 => "00111110011011010001000110111010", 
    13 => "10111110001101101111001010111101", 
    14 => "10111110101000110010110110010000", 
    15 => "00111101100001110110111011100011", 
    16 => "10111110100100110111011100100011", 
    17 => "00111101110101111001110110101001", 
    18 => "00111101000101111100110111101011", 
    19 => "00111110011101011010101000011111", 
    20 => "10111110100101010000101111001011", 
    21 => "00111110100001011010110011001000", 
    22 => "00111101101001001110101100001000", 
    23 => "10111110100010111110011010001010", 
    24 => "10111100001110111101100011111100", 
    25 => "10111110010011011000100011010100", 
    26 => "10111110100110101110010001011111", 
    27 => "00111110100110100101101001011110", 
    28 => "00111110000010001111100111100100", 
    29 => "10111110100101010101101111100000", 
    30 => "10111101011010100100100011010001", 
    31 => "10111101001000011000110001011011" );


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

entity nn_inference_hwmm_layer2_layer2_weights_23 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_23 is
    component nn_inference_hwmm_layer2_layer2_weights_23_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_23_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_23_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


