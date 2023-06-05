library IEEE;
use IEEE.std_logic_1164.all;

entity fullsomador is
port (	i_A : in std_logic_vector (31 downto 0);
      	i_B : in std_logic_vector (31 downto 0);
			i_CIN : in std_logic;
			o_COUT : out std_logic;
			o_S : out std_logic_vector (31 downto 0));
end fullsomador;
	
architecture design of fullsomador is
component somador
port (  i_A : in std_logic;
		  i_B : in std_logic;
		  i_CIN : in std_logic;
		  o_COUT : out std_logic;
		  o_S : out std_logic);
end component;
	
signal w_co0, w_co1, w_co2, w_co3, w_co4, w_co5, w_co6, w_co7, 
w_co8, w_co9, w_co10, w_co11, w_co12, w_co13, w_co14, w_co15, 
w_co16, w_co17, w_co18, w_co19, w_co20, w_co21, w_co22, w_co23, 
w_co24, w_co25, w_co26, w_co27, w_co28, w_co29, w_co30 : std_logic;

begin
		
		FS : somador port map(i_A (0), i_B (0), i_CIN, w_co0, o_S(0));
	
		FS1 : somador port map(i_A (1), i_B (1), w_co0, w_co1, o_S(1));
			
		FS2 : somador port map(i_A (2), i_B (2), w_co1, w_co2, o_S(2));
			
		FS3 : somador port map(i_A (3), i_B (3), w_co2, w_co3, o_S(3));
		
		FS4 : somador port map(i_A (4), i_B (4), w_co3, w_co4, o_S(4));
		
		FS5 : somador port map(i_A (5), i_B (5), w_co4, w_co5, o_S(5));
		
		FS6 : somador port map(i_A (6), i_B (6), w_co5, w_co6, o_S(6));
		
		FS7 : somador port map(i_A (7), i_B (7), w_co6, w_co7, o_S(7));
		
		FS8 : somador port map(i_A (8), i_B (8), w_co7, w_co8, o_S(8));
		
		FS9 : somador port map(i_A (9), i_B (9), w_co8, w_co9, o_S(9));
		
		FS10 : somador port map(i_A (10), i_B (10), w_co9, w_co10, o_S(10));
		
		FS11 : somador port map(i_A (11), i_B (11), w_co10, w_co11, o_S(11));
		
		FS12 : somador port map(i_A (12), i_B (12), w_co11, w_co12, o_S(12));
		
		FS13 : somador port map(i_A (13), i_B (13), w_co12, w_co13, o_S(13));
		
		FS14 : somador port map(i_A (14), i_B (14), w_co13, w_co14, o_S(14));
		
		FS15 : somador port map(i_A (15), i_B (15), w_co14, w_co15, o_S(15));
		
		FS16 : somador port map(i_A (16), i_B (16), w_co15, w_co16, o_S(16));
	
		FS17 : somador port map(i_A (17), i_B (17), w_co16, w_co17, o_S(17));
			
		FS18 : somador port map(i_A (18), i_B (18), w_co17, w_co18, o_S(18));
			
		FS19 : somador port map(i_A (19), i_B (19), w_co18, w_co19, o_S(19));
		
		FS20 : somador port map(i_A (20), i_B (20), w_co19, w_co20, o_S(20));
		
		FS21 : somador port map(i_A (21), i_B (21), w_co20, w_co21, o_S(21));
		
		FS22 : somador port map(i_A (22), i_B (22), w_co21, w_co22, o_S(22));
		
		FS23 : somador port map(i_A (23), i_B (23), w_co22, w_co23, o_S(23));
		
		FS24 : somador port map(i_A (24), i_B (24), w_co23, w_co24, o_S(24));
		
		FS25 : somador port map(i_A (25), i_B (25), w_co24, w_co25, o_S(25));
		
		FS26 : somador port map(i_A (26), i_B (26), w_co25, w_co26, o_S(26));
		
		FS27 : somador port map(i_A (27), i_B (27), w_co26, w_co27, o_S(27));
		
		FS28 : somador port map(i_A (28), i_B (28), w_co27, w_co28, o_S(28));
		
		FS29 : somador port map(i_A (29), i_B (29), w_co28, w_co29, o_S(29));
		
		FS30 : somador port map(i_A (30), i_B (30), w_co29, w_co30, o_S(30));
		
		FS31 : somador port map(i_A (31), i_B (31), w_co30, o_COUT, o_S(31));
	
end design;
