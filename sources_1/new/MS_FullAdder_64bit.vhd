library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MS_FullAdder_64bit is
end MS_FullAdder_64bit;

architecture Behavioral of MS_FullAdder_64bit is

component FullAdder_64bit is
    port (  A : in std_logic_vector (63 downto 0);
            B : in std_logic_vector (63 downto 0);
            CIN : in std_logic;
            S : out std_logic_vector (63 downto 0);
            COUT : out std_logic  );
end component;

signal A, B, S : std_logic_vector (63 downto 0);
signal CIN, COUT : std_logic;

begin

Comp: FullAdder_64bit port map (A => A, B => B, CIN => CIN, S => S, COUT => COUT);

CIN_values: process
begin
    CIN <= '0';
    wait for 50 ns;
    CIN <= '1';
    wait for 50 ns;
end process;

A_values: process
begin
    A <= x"0021_0002_FDAC_4519";
    wait for 100 ns;
    A <= x"0000_FACE_1234_6543";
    wait for 100 ns;
end process;

B_values: process
begin
    
end process;



end Behavioral;
