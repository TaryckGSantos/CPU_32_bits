library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity ULA is
port ( i_A            : in std_logic_vector (31 downto 0);
		 i_B            : in std_logic_vector (31 downto 0);
		 i_ControlULA   : in std_logic_vector (3 downto 0);
		 o_R            : out std_logic_vector (31 downto 0);
		 o_Zero         : out std_logic);
end ULA;

architecture arc_1 of ULA is
	
	signal w_R : std_logic_vector (31 downto 0);
	
begin

	process (i_A, i_B, i_ControlULA)
	
	begin
		case i_ControlULA is
		
			when "0000" =>
				w_R <= i_A AND i_B;
				
			when "0001" =>
				w_R <= i_A OR i_B;
				
			when "0010" =>
				w_R <= i_A + i_B;
				
			when "0110" =>
				w_R <= i_A - i_B;
				
			when "0111" =>
				if (i_A < i_B) then
					w_R <= x"00000001";
				else
					w_R <= x"00000000";
				end if;
				
			when "1100" =>
				w_R <= i_A NOR i_B;
				
			when others => null;
				w_R <= x"00000000";
			
		end case;
	end process;	
	
	o_R <= w_R;
	o_Zero <= '1' when w_R = x"00000000" else
	          '0';
				 
end arc_1;
