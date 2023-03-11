library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ThreeStateBuffer is
    Port ( A : in STD_LOGIC;
           ENABLE : in STD_LOGIC;
           Y : out STD_LOGIC);
end ThreeStateBuffer;

architecture Behavioral of ThreeStateBuffer is

begin

process(ENABLE, A)
begin
    if ENABLE = '1' then
        Y <= A;
    else Y <= 'U';
    end if;
end process;

end Behavioral;
