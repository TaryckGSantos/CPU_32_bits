library ieee;
use ieee.std_logic_1164.all;

entity tb_mux_2x1_32bits is
end tb_mux_2x1_32bits;

architecture behavior of tb_mux_2x1_32bits is 
component mux_2x1_32bits is
port ( i_R1 : in std_logic_vector(31 downto 0);
		 i_R0 : in std_logic_vector(31 downto 0);
		 i_S : in std_logic;
		 o_Q : out std_logic_vector(31 downto 0));
end component;

signal w_R1, w_R0, w_Q : std_logic_vector(31 downto 0);
signal w_S : std_logic;

begin

	u_DUT: mux_2x1_32bits port map(i_R1 => w_R1,
											 i_R0 => w_R0,
											 i_S => w_S,
											 o_Q => w_Q);
			 process
			 begin
			 
			 w_R1 <= x"00000000";
			 w_R0 <= x"00000000";
			 w_S <= '0';
			 w_Q <= w_R1;
			 wait for 10ns;
			 
			 w_R1 <= x"00000010";
			 w_R0 <= x"00000001";
			 w_S <= '0';
			 w_Q <= w_R1;
			 wait for 10ns;
			 
			 w_R1 <= x"00000010";
			 w_R0 <= x"00000001";
			 w_S <= '1';
			 w_Q <= w_R0;
			 wait for 10ns;
			 
			 w_R1 <= x"00000000";
			 w_R0 <= x"00000000";
			 w_S <= '0';
			 w_Q <= w_R1;
			 wait;
			 end process;
end behavior;
