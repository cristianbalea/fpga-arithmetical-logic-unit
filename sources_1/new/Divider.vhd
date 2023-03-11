library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Divider is
    Port (  X : in std_logic_vector (63 downto 0);
            Y : in std_logic_vector (31 downto 0);
            Quotient : out std_logic_vector (31 downto 0);
            Remainder : out std_logic_vector (63 downto 0) );
end Divider;

architecture Behavioral of Divider is

begin

process(X,Y)
variable r : STD_LOGIC_VECTOR(63 downto 0);
variable q : STD_LOGIC_VECTOR(63 downto 0);
begin

   q := (others => '0');
   r := (others => '0');
   
   for i in 63 downto 0 loop
   
      r := r(62 downto 0) & "0";
      r(0) := X(i);
      
      if r >= Y then
          q(i) := '1';
          r := r - Y;
      end if;     
   end loop;
   
   Quotient <= q(31 downto 0);
   Remainder <= r;  
   
end process;


end Behavioral;
