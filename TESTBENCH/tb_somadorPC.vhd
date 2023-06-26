library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity tb_somadorPC is
end tb_somadorPC;

architecture behavior of tb_somadorPC is 
component somadorPC is
port (	i_PC : in std_logic_vector (31 downto 0);
			o_somadorPC : out std_logic_vector (31 downto 0));
end component;

signal w_PC, w_somadorPC std_logic_vector (31 downto 0);

begin

	u_DUT:	somadorPC port map(i_PC => w_PC,
										 o_somadorPC => w_somadorPC);
				process
				begin
				
				w_PC <= x"00000000";
				w_somadorPC <= x"00000000";
				wait for 20ns;
				
				w_PC <= x"00000000";
				w_somadorPC <= x"00000004";
				wait for 20ns;
				
				w_PC <= x"00000004";
				w_somadorPC <= x"00000008";
				wait for 20ns;
				
				w_PC <= x"00000008";
				w_somadorPC <= x"0000000c";
				wait for 20ns;
				
				w_PC <= x"FFFFFFEC";
				w_somadorPC <= x"FFFFFFF0";
				wait;
				end process;
				
end behavior;
