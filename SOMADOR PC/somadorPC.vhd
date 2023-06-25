library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity somadorPC is
port (	i_PC : in std_logic_vector (31 downto 0);
			o_somadorPC : out std_logic_vector (31 downto 0));
end somadorPC;
	
architecture design of somadorPC is

begin
		
		o_somadorPC <= i_PC + 4;
	
end design;
