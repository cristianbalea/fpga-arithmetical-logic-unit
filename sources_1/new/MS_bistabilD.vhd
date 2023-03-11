library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MS_bistabilD is
end MS_bistabilD;

architecture Behavioral of MS_bistabilD is

component bistabilD is
    Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Reset: in std_logic;
           Set: in std_logic;
           Q : out STD_LOGIC);
end component;

signal D, CLK, Q, Reset, Set : std_logic;

begin

Comp: bistabilD port map (D => D, CLK => CLK, Reset => Reset, Set => Set, Q => Q);

D_values: process
begin
    D <= '0';
    wait for 100 ns;
    D <= '1';
    wait for 100 ns;
end process;


CLOCK: process
begin
    if CLK = 'U' then
        CLK <= '0';
    else
        CLK <= not CLK;
    end if;
    wait for 30 ns;
end process;

process
begin
    Reset <= '0';
    Set <= '0';
    wait for 200 ns;
    
    Reset <= '0';
    Set <= '1';
    wait for 100 ns;
    
    Reset <= '1';
    Set <= '0';
    wait for 100 ns;
    
    Reset <= '0';
    Set <= '0';
    wait for 800 ns;
    
    
    
end process;


end Behavioral;
