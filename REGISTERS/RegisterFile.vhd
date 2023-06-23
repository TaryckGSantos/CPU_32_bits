library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

entity RegisterFile is
port ( i_ReadReg1  : in std_logic_vector (4 downto 0);
		 i_ReadReg2  : in std_logic_vector (4 downto 0);
		 i_WriteReg  : in std_logic_vector (4 downto 0);
		 i_writeData : in std_logic_vector (31 downto 0);
		 i_RegWrite  : in std_logic;
		 o_readData1 : out std_logic_vector (31 downto 0);
		 o_readData2 : out std_logic_vector (31 downto 0)
	);
end RegisterFile;

architecture arch_1 of RegisterFile is

	type reg_file_type is array (0 to 2 ** 5 - 1) of std_logic_vector(31 downto 0);

	signal array_reg : reg_file_type := (
		x"00000000", --$zero
		x"11111111", --$at
		x"22222222", --$v0
		x"33333333", --$v1
		x"44444444", --$a0
		x"55555555", --$a1
		x"66666666", --$a2
		x"77777777", --$a3
		x"88888888", --$t0
		x"99999999", --$t1
		x"aaaaaaaa", --$t2
		x"bbbbbbbb", --$t3
		x"cccccccc", --$t4
		x"dddddddd", --$t5
		x"eeeeeeee", --$t6
		x"ffffffff", --$t7
		x"00000000", --$s0
		x"11111111", --$s1
		x"22222222", --$s2
		x"33333333", --$s3
		x"44444444", --$s4
		x"55555555", --$s5
		x"66666666", --$s6
		x"77777777", --$s7
		x"88888888", --$t8
		x"99999999", --$t9
		x"aaaaaaaa", --$k0
		x"bbbbbbbb", --$k1
		x"10008000", --$global pointer
		x"7FFFF1EC", --$stack pointer
		x"eeeeeeee", --$frame pointer
		x"ffffffff" --$return address
	);
	
begin
	process (i_RegWrite) 
	begin

		if (i_RegWrite = '1') then
			array_reg(to_integer(unsigned(i_WriteReg))) <= i_writeData;
		
		end if;
	end process;

	o_readData1 <= array_reg(to_integer(unsigned(i_ReadReg1)));
	o_readData2 <= array_reg(to_integer(unsigned(i_ReadReg2)));

end arch_1;
