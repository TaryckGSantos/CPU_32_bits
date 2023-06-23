library ieee;
use ieee.std_logic_1164.all;

entity ULA_control is
port ( i_Funct : in std_logic_vector(5 downto 0);
		 i_OpULA : in std_logic_vector(1 downto 0);
		 o_OP : out std_logic_vector(3 downto 0));
end ULA_control;
	
architecture arch_1 of ULA_control is 
begin
		process(i_Funct, i_OpULA)
		begin
		
		if i_OpULA = "00" then
			o_OP <= "0010";
		
		elsif i_OpULA = "01" then 
			o_OP <= "0110";
			
		elsif i_OpULA = "10" then 
			if i_Funct(3 downto 0) = "0000" then
				o_OP <= "0010";
				
			elsif i_Funct(3 downto 0) = "0010" then
				o_OP <= "0110"; 
				
			elsif i_Funct(3 downto 0) = "0100" then
				o_OP <= "0000";
			
			elsif i_Funct(3 downto 0) = "0101" then
				o_OP <= "0001"; 	
				
			elsif i_Funct(3 downto 0) = "1010" then
				o_OP <= "0111";
			
			else 
				null;
				
			end if;
			
			else 
				null;
		
		end if;
		end process;
		
end arch_1;
