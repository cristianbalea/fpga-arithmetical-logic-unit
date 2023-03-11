library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FullAdder_64bit is
    port (  A : in std_logic_vector (63 downto 0);
            B : in std_logic_vector (63 downto 0);
            CIN : in std_logic;
            S : out std_logic_vector (63 downto 0);
            COUT : out std_logic  );
end FullAdder_64bit;

architecture Behavioral of FullAdder_64bit is

component FullAdder_32bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           CIN : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (31 downto 0);
           COUT : out STD_LOGIC);
end component;

signal partialCOUT : std_logic;

begin

AddLow: FullAdder_32bit port map (A => A(31 downto 0), B => B(31 downto 0), 
    CIN => CIN, S => S(31 downto 0), COUT => partialCOUT);
AddHigh: FullAdder_32bit port map (A => A(63 downto 32), B => B(63 downto 32),
    CIN => partialCOUT, S => S(63 downto 32), COUT => COUT);

end Behavioral;
