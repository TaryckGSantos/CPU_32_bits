library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity tb_DataMemory is
end tb_DataMemory;

architecture behavior of tb_DataMemory is
component DataMemory is
port ( i_clk: in std_logic;
		 i_Address   : in std_logic_vector (31 downto 0);
		 i_WriteData : in std_logic_vector (31 downto 0);
		 i_MemRead   : in std_logic;
		 i_MemWrite  : in std_logic;
		 o_ReadData  : out std_logic_vector (31 downto 0));
end component;

signal w_Address, w_WriteData, w_ReadData : std_logic_vector (31 downto 0);
signal w_clk, w_MemRead, w_MemWrite : std_logic;

begin

	u_DUT: DataMemory port map(i_clk => w_clk,
										i_Address => w_Address,
										i_WriteData => w_WriteData,
										i_MemRead => w_MemRead,
										i_MemWrite => w_MemWrite,
										o_ReadData => w_ReadData);
			 process
			 begin
			 
			 w_clk <= '0';
			 w_Address <= x"00000000";
			 w_WriteData <= x"00000000";
			 w_MemRead <= '0';
			 w_MemWrite <= '0';
			 w_ReadData <= x"00000000";
			 wait for 20ns;
			 
			 w_clk <= '0';
			 w_Address <= x"10010000";
			 w_WriteData <= x"11112222";
			 w_MemRead <= '0';
			 w_MemWrite <= '1';
			 w_ReadData <= x"00000000";
			 wait for 20ns;
			 
			 w_clk <= '1';
			 w_Address <= x"10010000";
			 w_WriteData <= x"11112222";
			 w_MemRead <= '0';
			 w_MemWrite <= '1';
			 w_ReadData <= x"00000000";
			 wait for 20ns;
			 
			 w_clk <= '0';
			 w_Address <= x"10010000";
			 w_WriteData <= x"00000000";
			 w_MemRead <= '1';
			 w_MemWrite <= '0';
			 w_ReadData <= x"00000000";
			 wait for 20ns;
			 
			 w_clk <= '1';
			 w_Address <= x"10010000";
			 w_WriteData <= x"00000000";
			 w_MemRead <= '1';
			 w_MemWrite <= '0';
			 w_ReadData <= x"11112222";
			 wait for 20ns;
			 
			 w_clk <= '0';
			 w_Address <= x"00000000";
			 w_WriteData <= x"00000000";
			 w_MemRead <= '0';
			 w_MemWrite <= '0';
			 w_ReadData <= x"00000000";
			 wait;
			 end process;
			 
end behavior;
