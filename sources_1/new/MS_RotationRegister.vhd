library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MS_RotationRegister is
end MS_RotationRegister;

architecture Behavioral of MS_RotationRegister is

component RotationRegister is
    port ( A : in std_logic_vector (31 downto 0);
           CLK : in std_logic;
           DIR : in std_logic;
           LOAD: in std_logic;
           Y : out std_logic_vector (31 downto 0));
end component;

signal A, Y : std_logic_vector (31 downto 0);
signal CLK, DIR, LOAD : std_logic;

begin

Comp: RotationRegister port map (A => A, CLK => CLK, DIR => DIR, LOAD => LOAD, Y => Y);

CLOCK:process
begin
    if CLK = 'U' then
        CLK <= '0';
    else
        CLK <= not CLK;
    end if;
    wait for 50 ns;
end process;

A_values: process
begin
    A <= x"FF00_0000";
    wait for 100 ns;
end process;

DIR_values: process
begin
    DIR <= '1';
    wait for 1000 ns;
    DIR <= '0';
    wait for 1000 ns;
end process;

LOAD_values: process
begin
    LOAD <= '1';
    wait for 100 ns;
    LOAD <= '0';
    wait for 1900 ns;
end process;


end Behavioral;
