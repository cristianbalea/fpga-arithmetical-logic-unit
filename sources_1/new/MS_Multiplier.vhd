library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MS_Multiplier is
end MS_Multiplier;

architecture Behavioral of MS_Multiplier is

component Multiplier is
    Port (  X : in std_logic_vector (31 downto 0); -- multiplicand
            Y : in std_logic_vector (31 downto 0); -- multiplier
            P : out std_logic_vector (63 downto 0) ); -- product
end component;

signal X, Y : std_logic_vector (31 downto 0);
signal P : std_logic_vector (63 downto 0);

begin

CompMultiplier: Multiplier port map (X => X, Y => Y, P => P);

X_values: process
begin
    X <= x"0000_0007";
    wait for 100 ns;
    X <= x"0000_0020";
    wait for 100 ns;
    X <= x"0000_0111";
    wait for 100 ns;
end process;

Y_values: process
begin
    Y <= x"0000_0008";
    wait for 50 ns;
    Y <= x"0000_0111";
    wait for 50 ns;
    Y <= x"0000_0002";
    wait for 50 ns;
    Y <= x"0000_0020";
    wait for 50 ns;
end process;


end Behavioral;
