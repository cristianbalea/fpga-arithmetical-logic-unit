library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SSD is
    Port ( clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           d0 : in std_logic_vector (3 downto 0);
           d1 : in std_logic_vector (3 downto 0);
           d2 : in std_logic_vector (3 downto 0);
           d3 : in std_logic_vector (3 downto 0));
end SSD;

architecture Behavioral of SSD is

signal count : std_logic_vector (15 downto 0) := (others => '0');
signal q1 : std_logic_vector (3 downto 0) := (others => '0');
signal q2 : std_logic_vector (3 downto 0) := (others => '0');
signal q3 : std_logic_vector (6 downto 0) := (others => '0');


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
                when "00" => q2 <= d0;
                when "01" => q2 <= d1;
                when "10" => q2 <= d2;
                when others => q2 <= d3;
             end case;
     end process;
     
     process(q2)
     begin 
        case(q2) is
            when "0001" => q3 <= "1111001"; --1
            when "0010" => q3 <= "0100100"; --2
            when "0011" => q3 <= "0110000"; --3
            when "0100" => q3 <= "0011001"; --4
            when "0101" => q3 <= "0010010"; --5
            when "0110" => q3 <= "0000010"; --6
            when "0111" => q3 <= "1111000"; --7
            when "1000" => q3 <= "0000000"; --8
            when "1001" => q3 <= "0010000"; --9
            when "1010" => q3 <= "0001000"; --A
            when "1011" => q3 <= "0000011"; --b
            when "1100" => q3 <= "1000110"; --C
            when "1101" => q3 <= "0100001"; --d
            when "1110" => q3 <= "0000110"; --E
            when "1111" => q3 <= "0001110"; --F
            when others => q3 <= "1000000"; --0
        end case;
     end process;
     
     an <= q1;
     
     cat <= q3;
end Behavioral;
