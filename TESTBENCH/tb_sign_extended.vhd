library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_sign_extended is
end tb_sign_extended;

architecture behavior of tb_sign_extended is
component sign_extended is
port (
    i_16bits : in std_logic_vector(15 downto 0);
    o_32bits : out std_logic_vector(31 downto 0));

signal w_16bits : std_logic_vector(15 downto 0);
signal w_32bits : std_logic_vector(31 downto 0);

begin

	u_DUT: sign_extended port map(i_16bits => w_16bits,
											o_32bits => w_32bits);
			 process
			 begin
			 
			 w_16bits <= "0000000000000000"
			 w_32bits <= "00000000000000000000000000000000"
			 wait for 10ns;
			 
			 w_16bits <= "0000000000000010"
			 w_32bits <= "00000000000000000000000000000010"
			 wait for 10ns;
			 
			 w_16bits <= "0000000000001000"
			 w_32bits <= "00000000000000000000000000001000"
			 wait for 10ns;
			 
			 w_16bits <= "0000000000000000"
			 w_32bits <= "00000000000000000000000000000000"
			 wait;
			 end process
			 
end behavior;
