library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MS_NotGate_32bit is
end MS_NotGate_32bit;

architecture Behavioral of MS_NotGate_32bit is

component NotGate_32bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           Y : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal A, Y : std_logic_vector (31 downto 0);

begin

Comp: NotGate_32bit port map (A => A, Y => Y);

A_values: process
begin
    A <= x"abcd_ef01";
    wait for 100 ns;
    A <= x"0101_0101";
    wait for 100 ns;
    A <= x"1234_5678";
    wait for 100 ns;
end process;

end architecture;


