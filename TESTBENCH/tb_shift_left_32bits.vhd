library ieee;
use ieee.std_logic_1164.all;

entity tb_shift_left_32bits is
end tb_shift_left_32bits;

architecture behavior of tb_shift_left_32bits is
component shift_left_32bits is
port ( i_R : in std_logic_vector(31 downto 0);
		 o_Q : out std_logic_vector(31 downto 0));
end component;

signal w_R, w_Q : std_logic_vector(31 downto 0);

begin 

	u_DUT: shift_left_32bits port map(i_R => w_R,
												 o_Q => w_Q);
			 process
			 begin
			 
			 w_R <= x"00000000";
			 w_Q <= x"00000000";
			 wait for 10ns;
			 
			 w_R <= x"00000010";
			 w_Q <= w_R(29 downto 0) & "00";
			 wait;
			 end process;
			 
end behavior;
