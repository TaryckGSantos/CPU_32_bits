library ieee;
use ieee.std_logic_1164.all;

entity tb_control is
end tb_control;

architecture behavior of tb_control is
component control is
port ( i_instrucao : in std_logic_vector(5 downto 0);
		 o_RegDst :  out std_logic;
		 o_Jump :  out std_logic;
		 o_OrigALU :  out std_logic;
		 o_MemToReg :  out std_logic;
		 o_WriteReg :  out std_logic;
		 o_WriteMem :  out std_logic;
		 o_MemRead :  out std_logic;
		 o_Branch:  out std_logic;
		 o_ALUOp : out std_logic_vector(1 downto 0));
end component;

signal w_instrucao : std_logic_vector(5 downto 0);
signal w_RegDst, w_Jump, wOrigALU, w_MemToReg, w_WriteReg, w_WriteMem, w_MemRead, w_Branch : std_logic;
signal w_ALUOp std_logic_vector(1 downto 0);

begin

	u_DUT: control port map(i_instrucao => w_instrucao,
									o_RegDst => w_RegDst,
									o_Jump => w_Jump,
									o_OrigALU => w_OrigALU,
									o_MemToReg => w_MemToReg,
									o_WriteReg => w_WriteReg,
									o_WriteMem => w_WriteMem,
									o_MemRead => w_MemRead,
									o_Branch => w_Branch,
									o_ALUOp => w_ALUOp);
			 process
			 begin
			 
			 w_intrucao <= "111111";
			 w_RegDst <= '0';
			 w_Jump <= '0';
			 w_OrigALU <= '0';
			 w_MemToReg <= '0'; 
			 w_WriteReg <= '0';
			 w_MemRead <= '0';
			 w_WriteMem <= '0';
			 w_Branch <= '0';
			 w_ALUOp <= "00";
			 wait for 20ns;
			 
			 w_intrucao <= "000000";
			 w_RegDst <= '1';
			 w_Jump <= '0';
			 w_OrigALU <= '0';
			 w_MemToReg <= '0'; 
			 w_WriteReg <= '1';
			 w_MemRead <= '0';
			 w_WriteMem <= '0';
			 w_Branch <= '0';
			 w_ALUOp <= "10";
			 wait for 20ns;
			 
			 w_intrucao <= "100011";
			 w_RegDst <= '0';
			 w_Jump <= '0';
			 w_OrigALU <= '1';
			 w_MemToReg <= '1'; 
			 w_WriteReg <= '1';
			 w_MemRead <= '1';
			 w_WriteMem <= '0';
			 w_Branch <= '0';
			 w_ALUOp <= "00";
			 wait for 20ns;
			 
			 w_intrucao <= "101011";
			 w_RegDst <= 'X';
			 w_Jump <= '0';
			 w_OrigALU <= '1';
			 w_MemToReg <= 'X'; 
			 w_WriteReg <= '0';
			 w_MemRead <= '0';
			 w_WriteMem <= '1';
			 w_Branch <= '0';
			 w_ALUOp <= "00";
			 wait for 20ns;
			 
			 w_intrucao <= "000100";
			 w_RegDst <= 'X';
			 w_Jump <= '0';
			 w_OrigALU <= '0';
			 w_MemToReg <= 'X'; 
			 w_WriteReg <= '0';
			 w_MemRead <= '0';
			 w_WriteMem <= '0';
			 w_Branch <= '1';
			 w_ALUOp <= "01";
			 wait for 20ns;
			 
			 w_intrucao <= "000010";
			 w_RegDst <= 'X';
			 w_Jump <= '1';
			 w_OrigALU <= '0';
			 w_MemToReg <= 'X'; 
			 w_WriteReg <= '1';
			 w_MemRead <= '0';
			 w_WriteMem <= '0';
			 w_Branch <= '0';
			 w_ALUOp <= "00";
			 wait for 20ns;
			 
			 w_intrucao <= "111111";
			 w_RegDst <= '0';
			 w_Jump <= '0';
			 w_OrigALU <= '0';
			 w_MemToReg <= '0'; 
			 w_WriteReg <= '0';
			 w_MemRead <= '0';
			 w_WriteMem <= '0';
			 w_Branch <= '0';
			 w_ALUOp <= "00";
			 wait;
			 end process;
			 
end behavior;
