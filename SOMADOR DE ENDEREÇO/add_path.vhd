library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity add_path is
port (	i_PC : in std_logic_vector (31 downto 0);
			i_Inst_Extended : in std_logic_vector (31 downto 0);
			o_Dest : out std_logic_vector (31 downto 0));
end add_path;
	
architecture design of add_path is

begin
		
		o_Dest <= i_PC + i_Inst_Extended;
	
end design;
