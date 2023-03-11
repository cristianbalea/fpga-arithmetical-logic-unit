library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_logic_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- btn(0) CENTRU, btn(1) SUS, btn(2) STANGA, btn(3) DREAPTA, btn(4) JOS 
entity ALU is
    port (  clk : in std_logic;
            btn : in std_logic_vector (4 downto 0); 
            sw : in std_logic_vector (15 downto 0);
            led : out std_logic_vector (15 downto 0);
            an : out std_logic_vector (3 downto 0);
            cat : out std_logic_vector (6 downto 0));
end ALU;

architecture Behavioral of ALU is

component MPG is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC);
end component;

component SSD is
    Port ( clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           d0 : in std_logic_vector (3 downto 0);
           d1 : in std_logic_vector (3 downto 0);
           d2 : in std_logic_vector (3 downto 0);
           d3 : in std_logic_vector (3 downto 0));
end component;

component SSDoperations is
    Port ( clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           op : in STD_LOGIC_VECTOR (3 downto 0));
end component;

component FullAdder_32bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           CIN : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (31 downto 0);
           COUT : out STD_LOGIC);
end component;

component AndGate_32bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Y : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Divider is
    Port (  X : in std_logic_vector (63 downto 0);
            Y : in std_logic_vector (31 downto 0);
            Quotient : out std_logic_vector (31 downto 0);
            Remainder : out std_logic_vector (63 downto 0) );
end component;

component Multiplier is
    Port (  X : in std_logic_vector (31 downto 0); -- multiplicand
            Y : in std_logic_vector (31 downto 0); -- multiplier
            P : out std_logic_vector (63 downto 0) ); -- product
end component;

component NotGate_32bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           Y : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component OrGate_32bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Y : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component RotationRegister is
    port ( A : in std_logic_vector (31 downto 0);
           CLK : in std_logic;
           DIR : in std_logic;
           LOAD: in std_logic;
           Y : out std_logic_vector (31 downto 0));
end component;

component Rotate is 
port ( A : in std_logic_vector (31 downto 0);
       DIR : in std_logic;
       Y : out std_logic_vector (31 downto 0));
end component;

type state is (READ_OPERATION, READ_OP_1_HIGH, READ_OP_1_LOW,
                     READ_OP_2_HIGH, READ_OP_2_LOW,
                     READ_DIV_1_3, READ_DIV_1_2, READ_DIV_1_1, READ_DIV_1_0,
                     READ_DIV_2_HIGH, READ_DIV_2_LOW, 
                     WRITE_RESULT,
                     WRITE_RESULT_QUOTIENT, WRITE_RESULT_REMAINDER);
signal STARE : state := READ_OPERATION;
signal NXSTARE : state;

signal operation : std_logic_vector (3 downto 0);

signal ENABLE : std_logic;
signal SHOW : std_logic;
signal RESET : std_logic;
signal SAVE: std_logic;

signal selectWrite : std_logic_vector(1 downto 0) := "00";
signal toWrite : std_logic_vector (15 downto 0) := (others => '0');
signal toWrite_64bit : std_logic_vector (63 downto 0) := x"AAAA_BBBB_CCCC_DDDD";
signal auxResult : std_logic_vector (63 downto 0) := x"AAAA_BBBB_CCCC_DDDD";

signal SSDinput : std_logic := '0';
signal an0, an1 : std_logic_vector(3 downto 0);
signal cat0, cat1 : std_logic_vector(6 downto 0);

signal operand : std_logic_vector (63 downto 0) := (others => '0');
signal accumulator : std_logic_vector (63 downto 0) := (others => '0');

signal twosComplement : std_logic_vector(31 downto 0);

signal resultAdd : std_logic_vector(31 downto 0);
signal resultAnd : std_logic_vector(31 downto 0);
signal resultOr : std_logic_vector(31 downto 0);
signal resultNot : std_logic_vector(31 downto 0);
signal resultMul : std_logic_vector(63 downto 0);
signal resultQuotient : std_logic_vector(31 downto 0);
signal resultRemainder : std_logic_vector(63 downto 0);
signal resultSub : std_logic_vector(31 downto 0);
signal resultInc : std_logic_vector(31 downto 0);
signal resultDec : std_logic_vector(31 downto 0);
signal resultRorl : std_logic_vector(31 downto 0);
signal resultRorr : std_logic_vector(31 downto 0);

begin

Actualizeaza_stare: process(CLK)
begin
    if CLK = '1' and CLK'event then
        if SHOW = '1' then
            selectWrite <= selectWrite + 1;
        end if;
        if RESET = '1' then 
            STARE <= READ_OPERATION;
        elsif ENABLE = '1' then 
            STARE <= NXSTARE;
        end if;
    end if;
end process;
----------------------------------------------------------------------
Tranzitii_stari: process(STARE)
begin
    case STARE is
        when READ_OPERATION =>
            case sw(3 downto 0) is                                            
                when "0000" => -- adunare
                    operation <= sw(3 downto 0);
                    NXSTARE <= READ_OP_1_HIGH;                                                 
                when "0001" => -- scadere
                    operation <= sw(3 downto 0);
                    NXSTARE <= READ_OP_1_HIGH; 
                when "0010" => -- increment
                    operation <= sw(3 downto 0);
                    NXSTARE <= READ_OP_2_HIGH;
                when "0011" => -- decrement
                    operation <= sw(3 downto 0);
                    NXSTARE <= READ_OP_2_HIGH;                    
                when "0100" => -- and
                    operation <= sw(3 downto 0);
                    NXSTARE <= READ_OP_1_HIGH; 
                when "0101" => -- or
                    operation <= sw(3 downto 0);
                    NXSTARE <= READ_OP_1_HIGH; 
                when "0110" => -- not
                    operation <= sw(3 downto 0);
                    NXSTARE <= READ_OP_2_HIGH; 
                when "0111" => -- rorl
                    operation <= sw(3 downto 0);
                    NXSTARE <= READ_OP_2_HIGH; 
                when "1000" => -- rorr
                    operation <= sw(3 downto 0);
                    NXSTARE <= READ_OP_2_HIGH; 
                when "1001" => -- mul
                    operation <= sw(3 downto 0);
                    NXSTARE <= READ_OP_1_HIGH; 
                when "1010" => -- div
                    operation <= sw(3 downto 0);
                    NXSTARE <= READ_DIV_1_3; 
                when others => -- noop
                    NXSTARE <= READ_OPERATION;
            end case;
--------------------------------------------------                                                                                                                   
        when READ_OP_1_HIGH =>
            NXSTARE <= READ_OP_1_LOW;           
--------------------------------------------------
        when READ_OP_1_LOW =>
            NXSTARE <= READ_OP_2_HIGH;                   
--------------------------------------------------
        when READ_OP_2_HIGH =>
            NXSTARE <= READ_OP_2_LOW;
--------------------------------------------------
        when READ_OP_2_LOW =>
            NXSTARE <= WRITE_RESULT;   
--------------------------------------------------
        when READ_DIV_1_3 =>
            NXSTARE <= READ_DIV_1_2;            
--------------------------------------------------
        when READ_DIV_1_2 =>
            NXSTARE <= READ_DIV_1_1;
--------------------------------------------------
        when READ_DIV_1_1 =>
            NXSTARE <= READ_DIV_1_0;
--------------------------------------------------
        when READ_DIV_1_0 =>
            NXSTARE <= READ_DIV_2_HIGH;
--------------------------------------------------
        when READ_DIV_2_HIGH =>
            NXSTARE <= READ_DIV_2_LOW;
--------------------------------------------------
        when READ_DIV_2_LOW =>
            NXSTARE <= WRITE_RESULT_QUOTIENT;
--------------------------------------------------
        when WRITE_RESULT_QUOTIENT =>
            NXSTARE <= WRITE_RESULT_REMAINDER;
--------------------------------------------------
        when WRITE_RESULT_REMAINDER =>
            NXSTARE <= READ_OPERATION;
--------------------------------------------------
        when WRITE_RESULT =>
            NXSTARE <= READ_OPERATION;
    end case;
end process;
--------------------------------------------------
InputPentruSSD: process(STARE)
begin
    case STARE is
        when READ_OPERATION =>
            SSDinput <= '1';
        when others =>
            SSDinput <= '0';
    end case;
end process;

--------------------------------------------------
SalvareaInRegistriAOperanzilor: process(SAVE)
begin
    if SAVE = '1' then
        case STARE is
            when READ_OP_1_HIGH =>
                operand(31 downto 16) <= sw(15 downto 0);
            when REAd_OP_2_HIGH =>
                accumulator(31 downto 16) <= sw(15 downto 0);
            when READ_OP_1_LOW =>
                operand(15 downto 0) <= sw(15 downto 0);
            when READ_OP_2_LOW =>
                accumulator(15 downto 0) <= sw(15 downto 0);
            when READ_DIV_1_3 =>
                operand(63 downto 48) <= sw(15 downto 0);
            when READ_DIV_1_2 =>
                operand(47 downto 32) <= sw(15 downto 0);
            when READ_DIV_1_1 =>
                operand(31 downto 16) <= sw(15 downto 0);
            when READ_DIV_1_0 =>
                operand(15 downto 0) <= sw(15 downto 0);
            when READ_DIV_2_HIGH =>
                accumulator(31 downto 16) <= sw(15 downto 0);
            when READ_DIV_2_LOW =>
                accumulator(15 downto 0) <= sw(15 downto 0);
            when others =>
                null;
        end case;
    end if;
end process;
----------------------------------------------------------------------
Operatiile: process(operation)
begin
    case operation is                                            
        when "0000" => -- adunare
            toWrite_64bit <= x"0000_0000" & resultAdd;
        when "0001" => -- scadere
            toWrite_64bit <= x"0000_0000" & resultSub;
        when "0010" => -- increment
            toWrite_64bit <= x"0000_0000" & resultInc;
        when "0011" => -- decrement
            toWrite_64bit <= x"0000_0000" & resultDec;             
        when "0100" => -- and
            toWrite_64bit <= x"0000_0000" & resultAnd;
        when "0101" => -- or
            toWrite_64bit <= x"0000_0000" & resultOr;
        when "0110" => -- not
            toWrite_64bit <= x"0000_0000" & resultNot;
        when "0111" => -- rorl
            toWrite_64bit <= x"0000_0000" & resultRorl;
        when "1000" => -- rorr
            toWrite_64bit <= x"0000_0000" & resultRorr;
        when "1001" => -- mul
            toWrite_64bit <= resultMul;
        when "1010" => -- div
            toWrite_64bit <= x"0000_0000" & resultQuotient;
            auxResult <= resultRemainder;
        when others => -- noop
            null;    
    end case;
end process;

----------------------------------------------------------------------
NumarulAfisatPeSSD: process(selectWrite, STARE)
begin
    case STARE is
        when WRITE_RESULT =>
            if selectWrite = "00" then
                toWrite <= toWrite_64bit(63 downto 48);
            elsif selectWrite = "01" then
                toWrite <= toWrite_64bit(47 downto 32);
            elsif selectWrite = "10" then
                toWrite <= toWrite_64bit(31 downto 16);
            elsif selectWrite = "11" then
                toWrite <= toWrite_64bit(15 downto 0);
            end if;
        when WRITE_RESULT_QUOTIENT => 
            if selectWrite = "00" then
                toWrite <= toWrite_64bit(63 downto 48);
            elsif selectWrite = "01" then
                toWrite <= toWrite_64bit(47 downto 32);
            elsif selectWrite = "10" then
                toWrite <= toWrite_64bit(31 downto 16);
            elsif selectWrite = "11" then
                toWrite <= toWrite_64bit(15 downto 0);
            end if;
        when WRITE_RESULT_REMAINDER =>
            if selectWrite = "00" then
                toWrite <= auxResult(63 downto 48);
            elsif selectWrite = "01" then
                toWrite <= auxResult(47 downto 32);
            elsif selectWrite = "10" then
                toWrite <= auxResult(31 downto 16);
            elsif selectWrite = "11" then
                toWrite <= auxResult(15 downto 0);
            end if;
        when others =>
            toWrite <= sw(15 downto 0);
    end case;
end process;
---------------------------------------------------------------------- 
led(15 downto 14) <= selectWrite; -- 00 pentru 63-48, 01 pentru 37-32, 10 pentru 31-16, 11 pentru 15-0
led(13 downto 10) <= operation; -- verificam operatia
----------------------------------------------------------------------
NumereSauTextPeSSD: process(SSDinput)
begin
    if SSDinput = '0' then 
        an <= an0;
        cat <= cat0;
    elsif SSDinput = '1' then
        an <= an1;
        cat <= cat1;
    end if;
end process;
----------------------------------------------------------------------
StareaCurentaPeLeduri: process(STARE)
begin
    case STARE is
        when READ_OPERATION =>
            led(3 downto 0) <= "0000";
        when READ_OP_1_HIGH =>
            led(3 downto 0) <= "0001";
        when READ_OP_1_LOW =>
            led(3 downto 0) <= "0010";
        when READ_OP_2_HIGH =>
            led(3 downto 0) <= "0011";
        when READ_OP_2_LOW =>
            led(3 downto 0) <= "0100";
        when READ_DIV_1_3 =>
            led(3 downto 0) <= "0101";
        when READ_DIV_1_2 =>
            led(3 downto 0) <= "0110";
        when READ_DIV_1_1 =>
            led(3 downto 0) <= "0111";
        when READ_DIV_1_0 =>
            led(3 downto 0) <= "1000";
        when READ_DIV_2_HIGH =>
            led(3 downto 0) <= "1001";
        when READ_DIV_2_LOW => 
            led(3 downto 0) <= "1010";
        when WRITE_RESULT =>
            led(3 downto 0) <= "1011";
        when WRITE_RESULT_QUOTIENT => 
            led(3 downto 0) <= "1100";
        when WRITE_RESULT_REMAINDER =>
            led(3 downto 0) <= "1101";
        when others =>
            led(3 downto 0) <= "1111";
    end case;
end process;
----------------------------------------------------------------------
CompMPG0: MPG port map (btn => btn(0), clk => clk, en => ENABLE);
CompMPG1: MPG port map (btn => btn(0), clk => clk, en => SAVE);
CompMPG2: MPG port map (btn => btn(2), clk => clk, en => SHOW);
CompMPG3: MPG port map (btn => btn(3), clk => clk, en => RESET);

CompSSD0: SSD port map (clk => clk, an => an0, cat => cat0, d0 => toWrite(3 downto 0), 
    d1 => toWrite(7 downto 4), d2 => toWrite(11 downto 8), d3 => toWrite(15 downto 12));
CompSSD1: SSDoperations port map (clk => clk, an => an1, cat => cat1, op => sw(3 downto 0));

compAdd: FullAdder_32bit port map (
                A => operand(31 downto 0), 
                B => accumulator(31 downto 0), 
                CIN => '0', 
                S => resultAdd, 
                COUT => open);
compSub: FullAdder_32bit port map (
                A => operand(31 downto 0), 
                B => twosComplement, 
                CIN => '0', 
                S => resultSub, 
                COUT => open);
compInc: FullAdder_32bit port map (
                A => x"0000_0001", 
                B => accumulator(31 downto 0), 
                CIN => '0', 
                S => resultInc, 
                COUT => open);
compDec: FullAdder_32bit port map (
                A => x"FFFF_FFFF", 
                B => accumulator(31 downto 0), 
                CIN => '0', 
                S => resultDec, 
                COUT => open);
compAnd: AndGate_32bit port map (A => operand(31 downto 0), B => accumulator(31 downto 0), Y => resultAnd);
compOr: OrGate_32bit port map (A => operand(31 downto 0), B => accumulator(31 downto 0), Y => resultOr);
compNot: NotGate_32bit port map (A => accumulator(31 downto 0), Y => resultNot);
compMul: Multiplier port map (X => operand(31 downto 0), Y => accumulator(31 downto 0), P => resultMul);
compDiv: Divider port map (X => operand, Y => accumulator(31 downto 0), Quotient => resultQuotient, Remainder => resultRemainder);
compRotationRight: Rotate port map (A => accumulator(31 downto 0), DIR => '0', Y => resultRorl); -- dreapta
compRotationLeft: Rotate port map (A => accumulator(31 downto 0), DIR => '1', Y => resultRorr); -- stanga
----------------------------------------------------------------------
twosComplement <= resultNot + 1;
----------------------------------------------------------------------
process(operation, accumulator(31 downto 0), STARE)
begin
    if operation = "1010" 
    and (STARE = WRITE_RESULT_QUOTIENT or STARE = WRITE_RESULT_REMAINDER) 
    and accumulator(31 downto 0) = x"0000_0000" then
        led(7) <= '1';
    else led(7) <= '0';
    end if;
end process;
----------------------------------------------------------------------
process(operation, resultAdd, STARE)
begin
    if operation = "0000"
    and STARE = WRITE_RESULT
    and resultAdd > x"7fff_ffff" then
        led(8) <= '1';
    else led(8) <= '0';
    end if;
end process;
----------------------------------------------------------------------
process(operation, resultMul, STARE)
begin
    if operation = "1001"
    and STARE = WRITE_RESULT
    and resultAdd > x"7fff_ffff" then
        led(9) <= '1';
    else led(9) <= '0';
    end if;
end process;
end Behavioral;