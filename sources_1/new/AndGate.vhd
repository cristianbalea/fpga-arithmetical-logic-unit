library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AndGate is
    port ( A : in std_logic;
           B : in std_logic;
           Y : out std_logic );
end AndGate;

architecture Behavioral of AndGate is
begin
    Y <= A and B;
end Behavioral;