library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity instruction_memory is
port ( i_clk	: in std_logic;
	    i_rd	: in std_logic;
		 i_addr	: in std_logic_vector(31 downto 0);
		 o_q		: out std_logic_vector(31 downto 0));
end instruction_memory;

architecture arq_im of instruction_memory is

	type memory_inst is array(0 to 31) of std_logic_vector(31 downto 0);	 
	
	signal instrucao : memory_inst := ( "00000000000000000011010000000100", -- R4 recebe a constante 4
												   "00000000000000000001010000000000", -- D0 recebe R4 (primeira operacao)
												   "00000000000000000011001000000010", -- R2 recebe a constante 2
												   "00000000000000000000000100000001", -- R1 recebe D1
												   "00000000000000000000000000000000", -- R0 recebe D0
												   "00000000000000000010000100000010", -- R1 recebe a soma entre R0 e R2
												   "00000000000000000001000100000001", -- D1 recebe R1 (segunda operação)
												   "00000000000000000010000000000001", -- R0 recebe a soma entre R1 e R0
												   "00000000000000000001000100000000", -- D0 recebe R0
												   "00000000000000000000000000000000",
												   "00000000000000000000000000000000",
													"00000000000000000000000000000000",
												   "00000000000000000000000000000000",
												   "00000000000000000000000000000000",
												   "00000000000000000000000000000000",
												   "00000000000000000000000000000000",
													"00000000000000000000000000000000",  --17
													"00000000000000000000000000000000",
													"00000000000000000000000000000000",
													"00000000000000000000000000000000",
													"00000000000000000000000000000000",
													"00000000000000000000000000000000",
													"00000000000000000000000000000000",
													"00000000000000000000000000000000",
													"00000000000000000000000000000000",
													"00000000000000000000000000000000",
													"00000000000000000000000000000000",
													"00000000000000000000000000000000",
													"00000000000000000000000000000000",
													"00000000000000000000000000000000",
													"00000000000000000000000000000000",
													"00000000000000000000000000000000");
	begin 
	
	process(i_clk)
	begin
			if(rising_edge(i_clk)) then
					if(i_rd = '1') then
							o_q <= instrucao(conv_integer(i_addr));
					end if;
			end if;
	end process;
end arq_im;
