library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign_extended is
  port (
    i_16bits : in std_logic_vector(15 downto 0);
    o_32bits : out std_logic_vector(31 downto 0)
  );
end entity sign_extended;

architecture arch of sign_extended is
begin
  process(i_16bits)
  begin
    o_32bits <= (others => '0'); 
    
    if i_16bits(15) = '0' then
      o_32bits(31 downto 16) <= (others => '0'); 
      o_32bits(15 downto 0) <= i_16bits; 
    else
      o_32bits(31 downto 16) <= (others => '1'); 
      o_32bits(15 downto 0) <= i_16bits; 
    end if;
  end process;
end architecture arch;
