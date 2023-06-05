library IEEE;
use IEEE.std_logic_1164.all;

entity program_counter is
port ( i_clk : in std_logic;
		 i_pc_D : in std_logic_vector(31 downto 0);
		 o_pc_Q : out std_logic_vector(31 downto 0));
end program_counter;
	
architecture arq_pc of program_counter is

signal w_pc_Q : std_logic_vector(31 downto 0);
begin
		process(i_clk)
		begin
				if rising_edge(i_clk) then
						w_pc_Q <= i_pc_D;
						
				end if;
		end process;
		o_pc_Q <= w_pc_Q;		
end arq_pc;
