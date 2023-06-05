library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity somadorPC is
port (	i_A : in std_logic_vector (31 downto 0);
			o_S : out std_logic_vector (31 downto 0));
end somadorPC;
	
architecture design of somadorPC is

begin
		
		o_S <= i_A + 4;
	
end design;
