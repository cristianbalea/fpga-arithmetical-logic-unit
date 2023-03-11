library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Rotate is 
port ( A : in std_logic_vector (31 downto 0);
       DIR : in std_logic;
       Y : out std_logic_vector (31 downto 0));
end Rotate;

architecture Behavioral of Rotate is

begin

process(A, DIR)
begin
    if DIR = '1' then Y <= A(0) & A(31 downto 1);
    elsif DIR = '0' then Y <= A(30 downto 0) & A(31);
    end if;
end process;

end Behavioral;
