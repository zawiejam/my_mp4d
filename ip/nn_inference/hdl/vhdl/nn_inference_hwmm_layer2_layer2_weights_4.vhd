-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer2_layer2_weights_4_rom is 
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


architecture rtl of nn_inference_hwmm_layer2_layer2_weights_4_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111110100111000100110100000110", 
    1 => "00111110010011101000101110000100", 
    2 => "00111110110011001100010001001011", 
    3 => "10111100101110111001111110100000", 
    4 => "00111110100010010111110000111000", 
    5 => "10111110100011111100001010001000", 
    6 => "10111110011110101011000111001100", 
    7 => "00111100100110010110011101010001", 
    8 => "00111110011010000110110010100110", 
    9 => "00111110010100000010011010111000", 
    10 => "10111110100011001011110111010001", 
    11 => "10111110001110011010010100011000", 
    12 => "10111110000010001101001011101001", 
    13 => "10111011101110000001011111101001", 
    14 => "10111111011010110110100110001010", 
    15 => "10111110111010110100010010110001", 
    16 => "10111110100011101000011011101011", 
    17 => "10111101111100100110110000010000", 
    18 => "00111110110101101011101010101110", 
    19 => "00111111001000111001001111100100", 
    20 => "00111110001101100110011011110100", 
    21 => "00111110001110101010111100011000", 
    22 => "10111110010100000001011010100100", 
    23 => "00111110010000100010111011101101", 
    24 => "00111101110010100110111011100011", 
    25 => "00111101110011001100111111100001", 
    26 => "00111101110001101101111001100000", 
    27 => "10111110010010010110100101110000", 
    28 => "00111100110110111011100011010000", 
    29 => "00111110010010001011000100111100", 
    30 => "10111101111100010000011010001101", 
    31 => "00111110011100010010110001100111" );


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

entity nn_inference_hwmm_layer2_layer2_weights_4 is
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

architecture arch of nn_inference_hwmm_layer2_layer2_weights_4 is
    component nn_inference_hwmm_layer2_layer2_weights_4_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer2_layer2_weights_4_rom_U :  component nn_inference_hwmm_layer2_layer2_weights_4_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


