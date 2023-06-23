library ieee;
use ieee.std_logic_1164.all;

entity control is
port ( i_instrucao : in std_logic_vector(5 downto 0);
		 o_RegDst :  out std_logic;
		 o_OrigALU :  out std_logic;
		 o_MemToReg :  out std_logic;
		 o_WriteReg :  out std_logic;
		 o_WriteMem :  out std_logic;
		 o_MemRead :  out std_logic;
		 o_Branch:  out std_logic;
		 o_ALUOp : out std_logic_vector(1 downto 0));
end control;
	
architecture arch_1 of control is
begin
		process(i_instrucao)
		begin
			o_WriteReg <= '0';
			if i_instrucao = "000000" then
				o_RegDst <= '1';
				o_OrigALU <= '0';
				o_MemToReg <= '0'; 
				o_WriteReg <= '1';
				o_MemRead <= '0';
				o_WriteMem <= '0';
				o_Branch <= '0';
				o_ALUOp <= "10";
			
			elsif i_instrucao = "100011" then
				o_RegDst <= '0';
				o_OrigALU <= '1';
				o_MemToReg <= '1'; 
				o_WriteReg <= '1';
				o_MemRead <= '1';
				o_WriteMem <= '0';
				o_Branch <= '0';
				o_ALUOp <= "00";
				
			elsif i_instrucao = "101011" then
				o_RegDst <= 'X';
				o_OrigALU <= '1';
				o_MemToReg <= 'X'; 
				o_WriteReg <= '0';
				o_MemRead <= '0';
				o_WriteMem <= '1';
				o_Branch <= '0';
				o_ALUOp <= "00";
				
			elsif i_instrucao = "000100" then
				o_RegDst <= 'X';
				o_OrigALU <= '0';
				o_MemToReg <= 'X'; 
				o_WriteReg <= '0';
				o_MemRead <= '0';
				o_WriteMem <= '0';
				o_Branch <= '1';
				o_ALUOp <= "01";
				
			else 
				null;
				
			end if;
		end process;
		
end arch_1;
