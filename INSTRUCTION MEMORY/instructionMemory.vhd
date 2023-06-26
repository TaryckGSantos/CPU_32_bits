library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity instructionMemory is
port ( i_readAddress : in std_logic_vector (31 downto 0);
		 o_instruction : out std_logic_vector (31 downto 0));
end instructionMemory;

architecture arc_1 of instructionMemory is
	type RAM_16_x_32 is array(0 to 15) of std_logic_vector(31 downto 0);
	
	signal IM : RAM_16_x_32 := ( 	x"012a4024", -- and 	$t0, 	$t1, 	$t2
											x"01686025", -- or 	$t4, 	$t3, 	$t0
											x"01285020", -- add 	$t2, 	$t1, 	$t0
											x"01487022", -- sub $t6, $t2, $t0
											x"0149602a", -- slt 	$t4, 	$t2, 	$t1
											x"08100000", -- j para o inicio
											x"00000000", 
											x"00000000", 
											x"00000000", 
											x"00000000", 
											x"00000000",  
											x"00000000", 
											x"00000000",
											x"00000000",
											x"00000000",
											x"00000000");
begin
		
		o_instruction <= x"00000000" when 
			
			i_readAddress = x"003FFFFC" else 
			
				IM(( to_integer(unsigned(i_readAddress(9 downto 2)))));
		
end arc_1;
