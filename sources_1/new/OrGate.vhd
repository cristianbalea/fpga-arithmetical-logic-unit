library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OrGate is
    port (  A : in std_logic;
            B : in std_logic;
            Y : out std_logic );
end OrGate;

architecture Behavioral of OrGate is
begin
    Y <= A or B;
end Behavioral;