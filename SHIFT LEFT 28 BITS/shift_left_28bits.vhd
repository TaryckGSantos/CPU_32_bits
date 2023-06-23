library ieee;
use ieee.std_logic_1164.all;

entity shift_left_28bits is
port ( i_R : in std_logic_vector(25 downto 0);
		 o_Q : out std_logic_vector(27 downto 0));
end shift_left_28bits;
	
architecture arch_1 of shift_left_28bits is 
signal w_Q : std_logic_vector(27 downto 0);
begin
		w_Q <= i_R(25 downto 0) & "00";
		o_Q <= w_Q;
		
end arch_1;
