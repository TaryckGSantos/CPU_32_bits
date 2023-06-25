library IEEE;
use IEEE.std_logic_1164.all;

entity tb_CPU_32bits is
end tb_CPU_32bits;

architecture behavior of tb_CPU_32bits is
component CPU_32bits is 
port ( i_clk : in std_logic);
end component

signal w_clk: std_logic;

begin

	u_DUT:	CPU_32bits port map(i_clk => w_clk);

	process
	begin
	
	w_clk <= 0;
	wait for 10ns;
	
	w_clk <= 1;
	wait for 10ns;
	
	w_clk <= 0;
	assert false report "Test done." severity note;
   wait;
	end process;
	
end behavior;
