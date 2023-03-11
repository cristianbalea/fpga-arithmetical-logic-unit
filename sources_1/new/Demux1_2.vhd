library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demux1_2 is
    Port ( Y : in STD_LOGIC;
           S : in STD_LOGIC;
           A : out STD_LOGIC;
           B : out STD_LOGIC);
end Demux1_2;

architecture Behavioral of Demux1_2 is

component NotGate is
    Port ( A : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;

component AndGate is
    port ( A : in std_logic;
           B : in std_logic;
           Y : out std_logic );
end component;

signal notS : std_logic;

begin
    -- A = not S and Y;
    -- B = S and Y;
    CompNotS: NotGate port map (A => S, Y => notS);
    CompA: AndGate port map (A => notS, B => Y, Y => A);
    CompB: AndGate port map (A => S, B => Y, Y => B);

end Behavioral;
