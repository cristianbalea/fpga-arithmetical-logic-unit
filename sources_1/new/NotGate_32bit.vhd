library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NotGate_32bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           Y : out STD_LOGIC_VECTOR (31 downto 0));
end NotGate_32bit;

architecture Behavioral of NotGate_32bit is

component NotGate is
    Port ( A : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;

begin
NotGate0: NotGate port map (A => A(0), Y => Y(0));
NotGate1: NotGate port map (A => A(1), Y => Y(1));
NotGate2: NotGate port map (A => A(2), Y => Y(2));
NotGate3: NotGate port map (A => A(3), Y => Y(3));
NotGate4: NotGate port map (A => A(4), Y => Y(4));
NotGate5: NotGate port map (A => A(5), Y => Y(5));
NotGate6: NotGate port map (A => A(6), Y => Y(6));
NotGate7: NotGate port map (A => A(7), Y => Y(7));
NotGate8: NotGate port map (A => A(8), Y => Y(8));
NotGate9: NotGate port map (A => A(9), Y => Y(9));
NotGate10: NotGate port map (A => A(10), Y => Y(10));
NotGate11: NotGate port map (A => A(11), Y => Y(11));
NotGate12: NotGate port map (A => A(12), Y => Y(12));
NotGate13: NotGate port map (A => A(13), Y => Y(13));
NotGate14: NotGate port map (A => A(14), Y => Y(14));
NotGate15: NotGate port map (A => A(15), Y => Y(15));
NotGate16: NotGate port map (A => A(16), Y => Y(16));
NotGate17: NotGate port map (A => A(17), Y => Y(17));
NotGate18: NotGate port map (A => A(18), Y => Y(18));
NotGate19: NotGate port map (A => A(19), Y => Y(19));
NotGate20: NotGate port map (A => A(20), Y => Y(20));
NotGate21: NotGate port map (A => A(21), Y => Y(21));
NotGate22: NotGate port map (A => A(22), Y => Y(22));
NotGate23: NotGate port map (A => A(23), Y => Y(23));
NotGate24: NotGate port map (A => A(24), Y => Y(24));
NotGate25: NotGate port map (A => A(25), Y => Y(25));
NotGate26: NotGate port map (A => A(26), Y => Y(26));
NotGate27: NotGate port map (A => A(27), Y => Y(27));
NotGate28: NotGate port map (A => A(28), Y => Y(28));
NotGate29: NotGate port map (A => A(29), Y => Y(29));
NotGate30: NotGate port map (A => A(30), Y => Y(30));
NotGate31: NotGate port map (A => A(31), Y => Y(31));


end Behavioral;
