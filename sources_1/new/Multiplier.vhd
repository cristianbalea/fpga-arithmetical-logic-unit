library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Multiplier is
    Port (  X : in std_logic_vector (31 downto 0); -- multiplicand
            Y : in std_logic_vector (31 downto 0); -- multiplier
            P : out std_logic_vector (63 downto 0) ); -- product
end Multiplier;

architecture Behavioral of Multiplier is

begin

process(X, Y)

variable A, B : std_logic_vector (63 downto 0);
variable Q : std_logic_vector (31 downto 0);

begin
    B := x"0000_0000" & X;                          
    Q := Y;
    A := (others => '0');         
    
    for N in 0 to 31 loop                             
        if Q(0) = '1' then 
            A := A + B;
        end if;
        B := B(62 downto 0) & '0';                        
        Q := '0' & Q(31 downto 1);                          
    end loop;
    
    P <= A;

end process;

end Behavioral;