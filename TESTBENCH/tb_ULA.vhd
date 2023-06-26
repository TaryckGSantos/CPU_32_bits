library IEEE;
use IEEE.std_logic_1164.all;

entity tb_ULA is
end tb_ULA;

architecture behavior of tb_ULA is
component ULA is
port ( i_A            : in std_logic_vector (31 downto 0);
		 i_B            : in std_logic_vector (31 downto 0);
		 i_ControlULA   : in std_logic_vector (3 downto 0);
		 o_R            : out std_logic_vector (31 downto 0);
		 o_Zero         : out std_logic);
end component;

signal w_A, w_B: std_logic_vector (31 downto 0);
signal w_ControlULA: std_logic_vector (3 downto 0);
signal w_R: std_logic_vector (31 downto 0);
signal w_Zero: std_logic;

begin
	
	u_DUT:	ULA port map(i_A => w_A,
								 i_B => w_B,
								 i_ControlULA => w_ControlULA,
								 o_R => w_R,
								 o_Zero => w_Zero);
				process
				begin
				
				w_A <= x"00000001";
				w_B <= x"00000010";
				w_ControlULA <= "1111";
				w_R <= x"00000000";
				w_Zero <= '0';
				wait for 10ns;
				
				w_ControlULA <= "0000";
				w_R <= x"00000000";
				wait for 10ns
				
				w_ControlULA <= "0001";
				w_R <= x"00000011";
				wait for 10ns;
				
				w_ControlULA <= "0010";
				w_R <= x"00000011";
				wait for 10ns;
				
				w_ControlULA <= "0011";
				w_R <= "11111111111111111111111111111110";
				wait for 10ns;
				
				w_ControlULA <= "0111";
				w_R <= x"00000000";
				wait for 10ns;
				
				w_ControlULA <= "1100";
				w_R <= "11111111111111111111111111111100";
				wait for 10ns
				
				w_A <= x"00000000";
				w_B <= x"00000000";
				w_ControlULA <= "1111";
				w_R <= x"00000000";
				w_Zero <= '1';
				assert false report "Test done." severity note;
				wait;
				end process;
	
end behavior;
