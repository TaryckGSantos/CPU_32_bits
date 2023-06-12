library IEEE;
use IEEE.std_logic_1164.all;

entity instruction_register is
port ( i_clk : in std_logic;
		 i_ir_ld : in std_logic;
		 i_ir_D : in std_logic_vector(31 downto 0);
		 o_ir_Q : out std_logic_vector(31 downto 0));
end instruction_register;
	
architecture arq_ir of instruction_register is
signal w_ir_Q : std_logic_vector(31 downto 0);
begin
		process(i_clk)
		begin
				if rising_edge(i_clk) then
						if i_ir_ld = '1' then 
								w_ir_Q <= i_ir_D;
						end if;
				end if;
		end process;
		o_ir_Q <= w_ir_Q;		
end arq_ir;
