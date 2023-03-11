library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MS_FullAdder is
end MS_FullAdder;

architecture Behavioral of MS_FullAdder is

component FullAdder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : out STD_LOGIC;
           CIN : in STD_LOGIC;
           COUT : out STD_LOGIC);
end component;

signal A, B, S, CIN, COUT : std_logic;

begin

CompFullAdder: FullAdder port map (A => A, B => B, S => S, 
                        CIN => CIN, COUT => COUT);

A_values: process
begin
    A <= '0';
    wait for 400 ns;
    A <= '1';
    wait for 400 ns;
end process;

B_values: process
begin
    B <= '0';
    wait for 200 ns;
    B <= '1';
    wait for 200 ns;
end process;

CIN_values: process
begin
    CIN <= '0';
    wait for 100 ns;
    CIN <= '1'; 
    wait for 100 ns;
end process;



end Behavioral;
