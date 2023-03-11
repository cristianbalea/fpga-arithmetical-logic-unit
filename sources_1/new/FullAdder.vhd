library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : out STD_LOGIC;
           CIN : in STD_LOGIC;
           COUT : out STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is

component XorGate is
    port (  A : in std_logic;
            B : in std_logic;
            Y : out std_logic );
end component;

component AndGate is
    port ( A : in std_logic;
           B : in std_logic;
           Y : out std_logic );
end component;

component OrGate is
    port (  A : in std_logic;
            B : in std_logic;
            Y : out std_logic );
end component;

signal S1, S2, S3, S4 : std_logic;

begin

C1: XorGate port map (A => A, B => B, Y => S1);
C2: AndGate port map (A => A, B => B, Y => S2);
C3: OrGate port map (A => A, B => B, Y => S3);
C4: AndGate port map (A => S3, B => CIN, Y => S4);
C5: XorGate port map (A => S1, B => CIN, Y => S);
C6: OrGate port map (A => S2, B => S4, Y => COUT);

end Behavioral;