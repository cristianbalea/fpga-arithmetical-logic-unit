library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2_1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux2_1;

architecture Behavioral of Mux2_1 is

component OrGate is
    port (  A : in std_logic;
            B : in std_logic;
            Y : out std_logic );
end component;

component AndGate is
    port ( A : in std_logic;
           B : in std_logic;
           Y : out std_logic );
end component;

component NotGate is
    Port ( A : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;

signal notS, aux1, aux2 : std_logic;

begin
-- Y = (notS and A) or (S and B)

CompNotGate: NotGate port map (A => S, Y => notS); -- notS

CompAndGate1: AndGate port map (A => notS, B => A, Y => aux1); -- notS and A

CompAndGate2: AndGate port map (A => S, B => B, Y => aux2); -- S and B

CompOrGate: OrGate port map (A => aux1, B => aux2, Y => Y); -- (notS and A) or (S and B)

end Behavioral;
