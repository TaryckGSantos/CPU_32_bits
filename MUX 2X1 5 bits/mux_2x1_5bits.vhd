library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1_5bits is
port ( i_R1 : in std_logic_vector(4 downto 0);
		 i_R0 : in std_logic_vector(4 downto 0);
		 i_S0 : in std_logic;
		 o_Q : out std_logic_vector(4 downto 0));
end mux_2x1_5bits;
	
architecture arch_1 of mux_2x1_5bits is 
begin
		
		with i_S0 select 
				o_Q <= i_R1 when '0',
						 i_R0 when '1';
end arch_1;
