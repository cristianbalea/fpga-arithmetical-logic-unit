library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AndGate_32bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Y : out STD_LOGIC_VECTOR (31 downto 0));
end AndGate_32bit;

architecture Behavioral of AndGate_32bit is

component AndGate is
    port ( A : in std_logic;
           B : in std_logic;
           Y : out std_logic );
end component;

begin

AndGate0: AndGate port map (A => A(0), B => B(0), Y => Y(0));
AndGate1: AndGate port map (A => A(1), B => B(1), Y => Y(1));
AndGate2: AndGate port map (A => A(2), B => B(2), Y => Y(2));
AndGate3: AndGate port map (A => A(3), B => B(3), Y => Y(3));
AndGate4: AndGate port map (A => A(4), B => B(4), Y => Y(4));
AndGate5: AndGate port map (A => A(5), B => B(5), Y => Y(5));
AndGate6: AndGate port map (A => A(6), B => B(6), Y => Y(6));
AndGate7: AndGate port map (A => A(7), B => B(7), Y => Y(7));
AndGate8: AndGate port map (A => A(8), B => B(8), Y => Y(8));
AndGate9: AndGate port map (A => A(9), B => B(9), Y => Y(9));
AndGate10: AndGate port map (A => A(10), B => B(10), Y => Y(10));
AndGate11: AndGate port map (A => A(11), B => B(11), Y => Y(11));
AndGate12: AndGate port map (A => A(12), B => B(12), Y => Y(12));
AndGate13: AndGate port map (A => A(13), B => B(13), Y => Y(13));
AndGate14: AndGate port map (A => A(14), B => B(14), Y => Y(14));
AndGate15: AndGate port map (A => A(15), B => B(15), Y => Y(15));
AndGate16: AndGate port map (A => A(16), B => B(16), Y => Y(16));
AndGate17: AndGate port map (A => A(17), B => B(17), Y => Y(17));
AndGate18: AndGate port map (A => A(18), B => B(18), Y => Y(18));
AndGate19: AndGate port map (A => A(19), B => B(19), Y => Y(19));
AndGate20: AndGate port map (A => A(20), B => B(20), Y => Y(20));
AndGate21: AndGate port map (A => A(21), B => B(21), Y => Y(21));
AndGate22: AndGate port map (A => A(22), B => B(22), Y => Y(22));
AndGate23: AndGate port map (A => A(23), B => B(23), Y => Y(23));
AndGate24: AndGate port map (A => A(24), B => B(24), Y => Y(24));
AndGate25: AndGate port map (A => A(25), B => B(25), Y => Y(25));
AndGate26: AndGate port map (A => A(26), B => B(26), Y => Y(26));
AndGate27: AndGate port map (A => A(27), B => B(27), Y => Y(27));
AndGate28: AndGate port map (A => A(28), B => B(28), Y => Y(28));
AndGate29: AndGate port map (A => A(29), B => B(29), Y => Y(29));
AndGate30: AndGate port map (A => A(30), B => B(30), Y => Y(30));
AndGate31: AndGate port map (A => A(31), B => B(31), Y => Y(31));


end Behavioral;
