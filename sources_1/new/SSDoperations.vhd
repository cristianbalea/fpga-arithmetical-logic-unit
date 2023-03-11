library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SSDoperations is
    Port ( clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           op : in STD_LOGIC_VECTOR (3 downto 0));
end SSDoperations;

architecture Behavioral of SSDoperations is

signal count : std_logic_vector (15 downto 0) := (others => '0');
signal q1 : std_logic_vector (3 downto 0) := (others => '0');
signal q3 : std_logic_vector (6 downto 0) := (others => '0');

type letters is array(0 to 3) of std_logic_vector(6 downto 0);

signal add : letters := ("1111111", "0001000", "0100001", "0100001");
signal sub : letters := ("1111111", "0010010", "1000001", "0000011"); 
signal inc : letters := ("1111111", "1111001", "0101011", "0100111"); 
signal dec : letters := ("1111111", "0100001", "0000110", "0100111"); 
signal andd : letters := ("1111111", "0001000", "0101011", "0100001");
signal orr : letters := ("1111111", "1111111", "0100011", "0101111");
signal nott : letters := ("1111111", "0101011", "0100011", "0000111");
signal rorl : letters := ("0101111", "0100011", "0101111", "1100111");
signal rorr : letters := ("0101111", "0100011", "0101111", "0101111");
signal mul : letters := ("1111011", "0101011", "1100011", "1100111");
signal div : letters := ("1111111", "0100001", "1111011", "1100011");
signal noop : letters := ("0101011", "0100011", "0100011", "0001100");

signal operation : letters := ("1111111", "1111111", "1111111", "1111111");

begin


process(clk)
begin
    if clk'event and clk = '1' then 
        count <= count + '1';
    end if;
end process;

process(count(15 downto 14))
begin
    case(count(15 downto 14)) is
        when "00" => q1 <= "1110";
        when "01" => q1 <= "1101";
        when "10" => q1 <= "1011";
        when others => q1 <= "0111";
     end case;
end process;

process(count(15 downto 14))
    begin
        case(count(15 downto 14)) is
            when "00" => q3 <= operation(3);
            when "01" => q3 <= operation(2);
            when "10" => q3 <= operation(1);
            when others => q3 <= operation(0);
         end case;
end process;
 
process(op)
begin
    case op is                                            
        when "0000" => -- adunare
            operation <= add;                                                   
        when "0001" => -- scadere
            operation <= sub;
        when "0010" => -- increment
            operation <= inc;   
        when "0011" => -- decrement
            operation <= dec;   
        when "0100" => -- and
            operation <= andd;   
        when "0101" => -- or
            operation <= orr;   
        when "0110" => -- not
            operation <= nott;   
        when "0111" => -- rorl
            operation <= rorl;   
        when "1000" => -- rorr
            operation <= rorr;   
        when "1001" => -- mul
            operation <= mul;   
        when "1010" => -- div
            operation <= div;   
        when others => -- noop
            operation <= noop;
    end case;
end process;
 
an <= q1;
cat <= q3;

end Behavioral;
