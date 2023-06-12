library ieee;
use ieee.std_logic_1164.all;

entity registrador_ula is
port (  i_R : in std_logic_vector(31 downto 0);
		  i_CLK : in std_logic;
		  o_Q : out std_logic_vector(31 downto 0));
end registrador_ula;
	
architecture arch_1 of registrador_ula is
begin
	process
	begin
		wait until i_CLK' event and i_CLK = '1';
			o_Q <= i_R;
	end process;
end arch_1;
