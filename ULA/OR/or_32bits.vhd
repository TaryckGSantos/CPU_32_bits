library ieee;
use ieee.std_logic_1164.all;

entity or_32bits is
port ( i_A1 : in std_logic_vector(31 downto 0);
		 i_A0 : in std_logic_vector(31 downto 0);
		 o_Q : out std_logic_vector(31 downto 0));
end or_32bits;
	
architecture arch_1 of or_32bits is 
begin
		o_Q <= i_A1 or i_A0;
end arch_1;
