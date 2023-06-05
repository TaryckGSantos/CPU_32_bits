library IEEE;
use IEEE.std_logic_1164.all;

entity somador is
port (  i_A : in std_logic;
		  i_B : in std_logic;
		  i_CIN : in std_logic;
		  o_COUT : out std_logic;
		  o_S : out std_logic);
end somador;
	
architecture comp of somador is
begin
		
		o_S <= (not i_A and not i_B and i_CIN) or (not i_A and
		i_B and not i_CIN) or (i_A and not i_B and not i_CIN);
		o_COUT <= ((i_A and i_B) or (i_A and i_CIN) or (i_B and i_CIN));
		
end comp;
