library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity DataMemory is
port ( i_clk: in std_logic;
		 i_Address   : in std_logic_vector (31 downto 0);
		 i_WriteData : in std_logic_vector (31 downto 0);
		 i_MemRead   : in std_logic;
		 i_MemWrite  : in std_logic;
		 o_ReadData  : out std_logic_vector (31 downto 0));
end DataMemory;

architecture arch_1 of DataMemory is

	type RAM_16_x_32 is array(15 downto 0) of std_logic_vector(31 downto 0);
	
	signal w_Data_Memory : RAM_16_x_32;
	
	signal w_ReadData  :  std_logic_vector (31 downto 0);
	
begin
	
	process (i_clk) 
	begin
		if(rising_edge(i_clk)) then
			if (i_MemWrite = '1') then
				w_Data_Memory((to_integer(unsigned(i_Address)) - 268500992) / 4) <= i_WriteData;
				
			end if;
			
			if (i_MemRead = '1') then
				w_ReadData <= w_Data_Memory((to_integer(unsigned(i_Address)) - 268500992)/4);
				
			end if;
		end if;
	end process;
		o_ReadData <= w_ReadData;
end arch_1;
