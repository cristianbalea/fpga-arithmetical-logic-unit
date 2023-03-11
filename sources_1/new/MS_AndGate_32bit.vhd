library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MS_AndGate_32bit is
end MS_AndGate_32bit;

architecture Behavioral of MS_AndGate_32bit is

component AndGate_32bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Y : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal A, B, Y : std_logic_vector (31 downto 0);

begin

Comp: AndGate_32bit port map (A => A, B => B, Y => Y);

A_values: process
begin
    A <= x"0101_0101";
    wait for 50 ns;
    A <= x"FFFF_FFFF";
    wait for 50 ns;
    A <= x"AB45_CFED";
    wait for 50 ns;
end process;

B_values: process
begin
    B <= x"1010_1010";
    wait for 50 ns;
    B <= x"0435_1129";
    wait for 50 ns;
    B <= x"0001_753D";
    wait for 50 ns;
end process;


end Behavioral;
