library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity fullsubtractor is
port ( i_A : in std_logic_vector (31 downto 0);
		 i_B : in std_logic_vector (31 downto 0);
		 i_WIN : in std_logic;
		 o_WOUT : out std_logic;
		 o_S : out std_logic_vector (31 downto 0));
end fullsubtractor;
	
architecture design of fullsubtractor is
component subtrator
port (  i_A : in std_logic;
		  i_B : in std_logic;
		  i_WIN : in std_logic;
		  o_WOUT : out std_logic;
		  o_S : out std_logic);
end component;
	
signal w_wo0, w_wo1, w_wo2, w_wo3, w_wo4, w_wo5, w_wo6, w_wo7, w_wo8, w_wo9, w_wo10, w_wo11, w_wo12, w_wo13, w_wo14, w_wo15, w_wo16, w_wo17, w_wo18, w_wo19, w_wo20, w_wo21, w_wo22, w_wo23, w_wo24, w_wo25, w_wo26, w_wo27, w_wo28, w_wo29, w_wo30 : std_logic;
begin
FS0 : subtractor port map(i_A (0), i_B (0), i_WIN, w_wo0, o_S(0));
FS1 : subtractor port map(i_A (1), i_B (1), w_wo0, w_wo1, o_S(1));
FS2 : subtractor port map(i_A (2), i_B (2), w_wo1, w_wo2, o_S(2));
FS3 : subtractor port map(i_A (3), i_B (3), w_wo2, w_wo3, o_S(3));
FS4 : subtractor port map(i_A (4), i_B (4), w_wo3, w_wo4, o_S(4));
FS5 : subtractor port map(i_A (5), i_B (5), w_wo4, w_wo5, o_S(5));
FS6 : subtractor port map(i_A (6), i_B (6), w_wo5, w_wo6, o_S(6));
FS7 : subtractor port map(i_A (7), i_B (7), w_wo6, w_wo7, o_S(7));
FS8 : subtractor port map(i_A (8), i_B (8), w_wo7, w_wo8, o_S(8));
FS9 : subtractor port map(i_A (9), i_B (9), w_wo8, w_wo9, o_S(9));
FS10 : subtractor port map(i_A (10), i_B (10), w_wo9, w_wo10, o_S(10));
FS11 : subtractor port map(i_A (11), i_B (11), w_wo10, w_wo11, o_S(11));
FS12 : subtractor port map(i_A (12), i_B (12), w_wo11, w_wo12, o_S(12));
FS13 : subtractor port map(i_A (13), i_B (13), w_wo12, w_wo13, o_S(13));
FS14 : subtractor port map(i_A (14), i_B (14), w_wo13, w_wo14, o_S(14));
FS15 : subtractor port map(i_A (15), i_B (15), w_wo14, w_wo15, o_S(15));
FS16 : subtractor port map(i_A (16), i_B (16), w_wo15, w_wo16, o_S(16));
FS17 : subtractor port map(i_A (17), i_B (17), w_wo16, w_wo17, o_S(17));
FS18 : subtractor port map(i_A (18), i_B (18), w_wo17, w_wo18, o_S(18));
FS19 : subtractor port map(i_A (19), i_B (19), w_wo18, w_wo19, o_S(19));
FS20 : subtractor port map(i_A (20), i_B (20), w_wo19, w_wo20, o_S(20));
FS21 : subtractor port map(i_A (21), i_B (21), w_wo20, w_wo21, o_S(21));
FS22 : subtractor port map(i_A (22), i_B (22), w_wo21, w_wo22, o_S(22));
FS23 : subtractor port map(i_A (23), i_B (23), w_wo22, w_wo23, o_S(23));
FS24 : subtractor port map(i_A (24), i_B (24), w_wo23, w_wo24, o_S(24));
FS25 : subtractor port map(i_A (25), i_B (25), w_wo24, w_wo25, o_S(25));
FS26 : subtractor port map(i_A (26), i_B (26), w_wo25, w_wo26, o_S(26));
FS27 : subtractor port map(i_A (27), i_B (27), w_wo26, w_wo27, o_S(27));
FS28 : subtractor port map(i_A (28), i_B (28), w_wo27, w_wo28, o_S(28));
FS29 : subtractor port map(i_A (29), i_B (29), w_wo28, w_wo29, o_S(29));
FS30 : subtractor port map(i_A (30), i_B (30), w_wo29, w_wo30, o_S(30));
FS31 : subtractor port map(i_A (31), i_B (31), w_wo30, o_WOUT, o_S(31));

end design;
