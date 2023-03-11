library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MS_Demux1_2 is
end MS_Demux1_2;

architecture Behavioral of MS_Demux1_2 is

component Demux1_2 is
    Port ( Y : in STD_LOGIC;
           S : in STD_LOGIC;
           A : out STD_LOGIC;
           B : out STD_LOGIC);
end component;

signal Y, S, A, B : std_logic;

begin

Comp: Demux1_2 port map (Y => Y, S => S, A => A, B => B);

Y_values: process
begin
    Y <= '0';
    wait for 100 ns;
    Y <= '1';
    wait for 100 ns;
end process;

S_values: process
begin
    S <= '0';
    wait for 50 ns;
    S <= '1';
    wait for 50 ns;
end process;

end Behavioral;
