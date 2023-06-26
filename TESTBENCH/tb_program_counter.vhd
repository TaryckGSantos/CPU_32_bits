library IEEE;
use IEEE.std_logic_1164.all;

entity tb_program_counter is
end tb_program_counter;

architecture behavior of tb_program_counter is
component program_counter is
port ( i_clk : in std_logic;
		 i_pc_D : in std_logic_vector(31 downto 0);
		 o_pc_Q : out std_logic_vector(31 downto 0));
end component;

signal w_clk : std_logic;
signal w_pc_D, w_pc_Q : std_logic_vector(31 downto 0);

begin

	u_DUT: program_counter port map(i_clk => w_clk,
											  i_pc_D => w_pc_D,
											  o_pc_Q => w_pc_Q);
	process
	begin
	w_clk <= '0';
	w_pc_D <= x"00000004";
	w_pc_Q <= x"00000000";
	wait for 20ns;
	
	w_clk <= '1';
	w_pc_D <= x"00000004";
	w_pc_Q <= x"00000004";
	wait for 20ns;
	
	w_clk <= '0';
	w_pc_D <= x"00000008";
	w_pc_Q <= x"00000004";
	wait for 20ns;
	
	w_clk <= '1';
	w_pc_D <= x"00000008";
	w_pc_Q <= x"00000008";
	wait for 20ns;
	
	w_clk <= '0';
	w_pc_D <= x"0000000c";
	w_pc_Q <= x"00000008";
	wait for 20ns;
	
	w_clk <= '1';
	w_pc_D <= x"0000000c";
	w_pc_Q <= x"0000000c";
	wait for 20ns;
	
	w_clk <= '0';
	w_pc_D <= x"FFFFFFF0";
	w_pc_Q <= x"0000000c";
	wait for 20ns;
	
	w_clk <= '1';
	w_pc_D <= x"FFFFFFF0";
	w_pc_Q <= x"FFFFFFF0";
	wait for 20ns;
	
	w_clk <= '0';
	w_pc_D <= x"FFFFFFF0";
	w_pc_Q <= x"FFFFFFF0";
	wait;
	end process;
	
end behavior;
