library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XorGate is
    port (  A : in std_logic;
            B : in std_logic;
            Y : out std_logic );
end XorGate;

architecture Behavioral of XorGate is
begin
    Y <= A xor B;
end Behavioral;