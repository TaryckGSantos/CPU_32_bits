library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
port ( i_clk : in std_logic; 
		 i_w_data : in std_logic_vector(31 downto 0);
		 i_w_addr : in std_logic_vector(7 downto 0);
		 i_w_wr : in std_logic; 
		 i_rp_data : in std_logic_vector(7 downto 0);
		 i_rp_rd : in std_logic; 
		 i_rq_data : in std_logic_vector(7 downto 0);
		 i_rq_rd : in std_logic;
		 o_rp_data : out std_logic_vector(31 downto 0);
		 o_rq_data : out std_logic_vector(31 downto 0));
end register_file;
	
architecture arch_rf of register_file is

type register_type is array (0 to 31) of std_logic_vector (31 downto 0);
signal reg_array: register_type;
begin
		process(i_clk)
		begin
		
				if(rising_edge(i_clk)) then
						if (i_rp_rd = '1') then
								o_rp_data <= reg_array(to_integer(unsigned(i_rp_data)));
						end if;
						
						if (i_rq_rd = '1') then
								o_rq_data <= reg_array(to_integer(unsigned(i_rq_data)));
						end if;
						
						if (i_w_wr = '1') then 
								reg_array(to_integer(unsigned(i_w_addr))) <= i_w_data;
								if (i_rp_data = i_w_addr) then 
										o_rp_data <= i_w_data;
								end if;
								
								if (i_rq_data = i_w_addr) then 
										o_rq_data <= i_w_data;
								end if;
								
						end if;
				end if;	
		end process;
end arch_rf;
