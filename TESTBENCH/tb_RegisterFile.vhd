library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity tb_RegisterFile is
end tb_RegisterFile;

architecture behavior of tb_RegisterFile is
component RegisterFile is
port ( i_clk : in std_logic;
	    i_ReadReg1  : in std_logic_vector (4 downto 0);
		 i_ReadReg2  : in std_logic_vector (4 downto 0);
		 i_WriteReg  : in std_logic_vector (4 downto 0);
		 i_writeData : in std_logic_vector (31 downto 0);
		 i_RegWrite  : in std_logic;
		 o_readData1 : out std_logic_vector (31 downto 0);
		 o_readData2 : out std_logic_vector (31 downto 0));
end component;

signal w_clk, w_RegWrite : std_logic;
signal w_ReadReg1, w_ReadReg2, w_WriteReg : std_logic_vector (4 downto 0);
signal w_WriteData, w_readData1, w_readData2 : std_logic_vector (31 downto 0);

begin

	u_DUT: RegisterFile port map(i_clk => w_clk,
										  i_ReadReg1 => w_ReadReg1,
										  i_ReadReg2 => w_ReadReg2,
										  i_WriteReg => w_WriteReg,
										  i_WriteData => w_WriteData,
										  i_RegWrite => w_RegWrite,
										  o_readData1 => w_readData1,
										  o_readData2 => w_readData2);
			 process
			 begin
			 
			 for I in 0 to 30 loop
			 w_ReadReg1 <= std_logic_vector(to_unsigned(I, 5));
			 w_ReadReg2 <= std_logic_vector(to_unsigned(I + 1, 5));
			 wait for 15ns;
			 end loop;
			 
			 w_writeReg <= "01000"; -- t0
			 w_writeData <= x"a5a5a5a5";
			 wait for 20ns;
			 
			 w_RegWrite <= '1';
			 wait for 5ns;
			 
			 w_RegWrite <= '0';
			 wait;
			 end process;
			 
end behavior;
