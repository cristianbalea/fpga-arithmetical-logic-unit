library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MS_Mux2_1 is
end MS_Mux2_1;

architecture Behavioral of MS_Mux2_1 is

component Mux2_1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;

signal A, B, S, Y: std_logic;

begin

Comp: Mux2_1 port map (A => A, B => B, S => S, Y => Y);

S_values: process
begin
    S <= '0';
    wait for 25 ns;
    S <= '1';
    wait for 25 ns;
end process;

A_values: process
begin
    A <= '0';
    wait for 50 ns;
    A <= '1';
    wait for 50 ns;
end process;

B_values: process
begin
    B <= '0';
    wait for 100 ns;
    B <= '1';
    wait for 100 ns;
end process;


end Behavioral;
