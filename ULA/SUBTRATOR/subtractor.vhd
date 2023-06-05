library IEEE;
use IEEE.std_logic_1164.all;

entity subtractor is
port (  i_A : in std_logic;
		  i_B : in std_logic;
		  i_WIN : in std_logic;
		  o_WOUT : out std_logic;
		  o_S : out std_logic);
end subtractor;
	
architecture comp of subtractor is
begin
	
	o_S <= (not i_A and not i_B and i_WIN) or (not i_A and
	i_B and not i_WIN) or (i_A and not i_B and not i_WIN);
	o_WOUT <= ((not i_A and i_B) or (not i_A and i_WIN) or (i_B and i_WIN));
	
end comp;
