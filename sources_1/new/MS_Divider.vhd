library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MS_Divider is
end MS_Divider;

architecture Behavioral of MS_Divider is

component Divider is
    Port (  X : in std_logic_vector (63 downto 0);
            Y : in std_logic_vector (31 downto 0);
            Quotient : out std_logic_vector (31 downto 0);
            Remainder : out std_logic_vector (63 downto 0) );
end component;

signal X, R : std_logic_vector (63 downto 0);
signal Y, Q : std_logic_vector (31 downto 0);

begin

CompDivider: Divider port map (X => X, Y => Y, Quotient => Q, Remainder => R);

X_values: process
begin
    X <= x"0000_0000_0000_000A";
    wait for 100 ns;
    X <= x"0000_0000_0000_000B";
    wait for 100 ns;
    X <= x"0000_0000_0000_000C";
    wait for 100 ns;
    X <= x"0000_0000_0000_03E8";
    wait for 100 ns;
    X <= x"0000_0000_0000_1A23";
    wait for 100 ns;
    X <= x"0000_05FD_EDBD_7FA0";
    wait for 100 ns;
end process;

Y_values: process
begin
    Y <= x"0000_0001";
    wait for 50 ns;
    Y <= x"0000_0022";
    wait for 50 ns;
    Y <= x"0000_0003";
    wait for 50 ns;
    Y <= x"0000_0004";
    wait for 50 ns;
    Y <= x"0000_00FA";
    wait for 50 ns;
    Y <= x"0077_4abc";
    wait for 50 ns;
end process;

end Behavioral;
