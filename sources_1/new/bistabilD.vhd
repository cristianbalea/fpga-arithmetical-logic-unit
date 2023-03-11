library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bistabilD is
    Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Reset: in std_logic;
           Set: in std_logic;
           Q : out STD_LOGIC);
end bistabilD;

architecture Behavioral of bistabilD is

begin
process(CLK, Reset, Set)
begin
    if Reset = '1' then 
        Q <= '0';
    elsif Set = '1' then
        Q <= '1';
    elsif CLK'event and CLK = '1' then
        Q <= D;
    end if;
end process;
end Behavioral;
