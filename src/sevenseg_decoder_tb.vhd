----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 11:16:55 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is

    --declare component
    component sevenseg_decoder is
        Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
               o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
    end component sevenseg_decoder;
    
    -- declare signals needed to stimulate the UUT inputs
    signal input     : std_logic_vector(3 downto 0);
    signal output    : std_logic_vector(6 downto 0);
    
begin
    -- PORT MAPS ----------------------------------------
    sevenseg_decoder_uut : sevenseg_decoder port map (
	  i_Hex => input(3 downto 0),
	  o_seg_n => output(6 downto 0)
	);

    -- Implement the test plan here.  Body of process is continuously from time = 0  
	test_process : process 
	begin
	--test all cases
	--0
	input <= "0000"; wait for 10 ns;
	   assert (output = "1000000") report "bad with zero" severity failure;
	--1
	input <= "0001"; wait for 10 ns;
	   assert (output = "1111001") report "bad with one" severity failure;
	
	   wait; -- wait forever
	end process;

end test_bench;
