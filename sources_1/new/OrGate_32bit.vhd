library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OrGate_32bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Y : out STD_LOGIC_VECTOR (31 downto 0));
end OrGate_32bit;

architecture Behavioral of OrGate_32bit is

component OrGate is
    port (  A : in std_logic;
            B : in std_logic;
            Y : out std_logic );
end component;

begin

OrGate0: OrGate port map (A => A(0), B => B(0), Y => Y(0));
OrGate1: OrGate port map (A => A(1), B => B(1), Y => Y(1));
OrGate2: OrGate port map (A => A(2), B => B(2), Y => Y(2));
OrGate3: OrGate port map (A => A(3), B => B(3), Y => Y(3));
OrGate4: OrGate port map (A => A(4), B => B(4), Y => Y(4));
OrGate5: OrGate port map (A => A(5), B => B(5), Y => Y(5));
OrGate6: OrGate port map (A => A(6), B => B(6), Y => Y(6));
OrGate7: OrGate port map (A => A(7), B => B(7), Y => Y(7));
OrGate8: OrGate port map (A => A(8), B => B(8), Y => Y(8));
OrGate9: OrGate port map (A => A(9), B => B(9), Y => Y(9));
OrGate10: OrGate port map (A => A(10), B => B(10), Y => Y(10));
OrGate11: OrGate port map (A => A(11), B => B(11), Y => Y(11));
OrGate12: OrGate port map (A => A(12), B => B(12), Y => Y(12));
OrGate13: OrGate port map (A => A(13), B => B(13), Y => Y(13));
OrGate14: OrGate port map (A => A(14), B => B(14), Y => Y(14));
OrGate15: OrGate port map (A => A(15), B => B(15), Y => Y(15));
OrGate16: OrGate port map (A => A(16), B => B(16), Y => Y(16));
OrGate17: OrGate port map (A => A(17), B => B(17), Y => Y(17));
OrGate18: OrGate port map (A => A(18), B => B(18), Y => Y(18));
OrGate19: OrGate port map (A => A(19), B => B(19), Y => Y(19));
OrGate20: OrGate port map (A => A(20), B => B(20), Y => Y(20));
OrGate21: OrGate port map (A => A(21), B => B(21), Y => Y(21));
OrGate22: OrGate port map (A => A(22), B => B(22), Y => Y(22));
OrGate23: OrGate port map (A => A(23), B => B(23), Y => Y(23));
OrGate24: OrGate port map (A => A(24), B => B(24), Y => Y(24));
OrGate25: OrGate port map (A => A(25), B => B(25), Y => Y(25));
OrGate26: OrGate port map (A => A(26), B => B(26), Y => Y(26));
OrGate27: OrGate port map (A => A(27), B => B(27), Y => Y(27));
OrGate28: OrGate port map (A => A(28), B => B(28), Y => Y(28));
OrGate29: OrGate port map (A => A(29), B => B(29), Y => Y(29));
OrGate30: OrGate port map (A => A(30), B => B(30), Y => Y(30));
OrGate31: OrGate port map (A => A(31), B => B(31), Y => Y(31));


end Behavioral;
