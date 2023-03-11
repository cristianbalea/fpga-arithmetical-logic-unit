library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MS_FullAdder_32bit is
end MS_FullAdder_32bit;

architecture Behavioral of MS_FullAdder_32bit is

component FullAdder_32bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           CIN : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (31 downto 0);
           COUT : out STD_LOGIC);
end component;

signal A, B, S : std_logic_vector (31 downto 0);
signal CIN, COUT : std_logic;

begin

CompFA32bit: FullAdder_32bit port map (A => A, B => B, CIN => CIN, S => S, COUT => COUT);

A_values: process
begin
    A <= x"1234_6732";
    wait for 10 ns;
    A <= x"3000_4432";
    wait for 10 ns;
    A <= x"0000_54FC";
    wait for 10 ns;
    A <= x"FFFF_FFFF";
    wait for 10 ns;
end process;

B_values: process
begin
    B <= x"3244_0000";
    wait for 10 ns;
    B <= x"0000_1234";
    wait for 10 ns;
    B <= x"039F_F102";
    wait for 10 ns;
    B <= x"0000_0002";
    wait for 10 ns;
end process;

CIN_values: process
begin
    CIN <= '0';
    wait for 5 ns;
    CIN <= '1'; 
    wait for 5 ns;
end process;

end Behavioral;
