library ieee;
use ieee.std_logic_1164.all;

entity tb_ULA_control is
end tb_ULA_control;

architecture behavior of tb_ULA_control is
component ULA_control is 
port ( i_Funct : in std_logic_vector(5 downto 0);
		 i_OpULA : in std_logic_vector(1 downto 0);
		 o_OP : out std_logic_vector(3 downto 0));
end component;

signal w_Funct : std_logic_vector(5 downto 0);
signal w_OpULA : std_logic_vector(1 downto 0);
signal w_OP : std_logic_vector(3 downto 0);

begin

	u_DUT: ULA_control port map(i_Funct => w_Funct,
										 i_OpULA => w_OpULA,
										 o_OP => w_OP);
	process
	begin
	w_OpULA <= "10";
	w_Funct <= "100100"; --and
	wait for 10ns;
	
	w_OpULA <= "10";
	w_Funct <= "100101"; --or
	wait for 10ns;
	
	w_OpULA <= "10";
	w_Funct <= "100000"; --add
	wait for 10ns;
	
	w_OpULA <= "10";
	w_Funct <= "100010"; --sub
	wait for 10ns;
	
	w_OpULA <= "10";
	w_Funct <= "101010"; --slt
	wait for 10ns;
	
	-- load word
	w_OpULA <= "00";
	w_Funct <= "xxxxxx"; --and
	wait for 10ns;
	
	-- store word
	w_OpULA <= "00";
	w_Funct <= "xxxxxx"; --and
	wait for 10ns;
	
	-- branch equal
	w_OpULA <= "00";
	w_Funct <= "xxxxxx"; --and
	wait;
	end process;
	
end behavior;
