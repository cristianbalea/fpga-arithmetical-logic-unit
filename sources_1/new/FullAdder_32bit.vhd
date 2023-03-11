library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder_32bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           CIN : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (31 downto 0);
           COUT : out STD_LOGIC);
end FullAdder_32bit;

architecture Behavioral of FullAdder_32bit is

component FullAdder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           CIN : in STD_LOGIC;
           S : out STD_LOGIC;
           COUT : out STD_LOGIC);
end component;

signal C0_1, C1_2, C2_3, C3_4, C4_5, C5_6, C6_7, C7_8, C8_9, C9_10, 
    C10_11, C11_12, C12_13, C13_14, C14_15, C15_16, C16_17, C17_18,
    C18_19, C19_20, C20_21, C21_22, C22_23, C23_24, C24_25, C25_26, 
    C26_27, C27_28, C28_29, C29_30, C30_31 : std_logic;

begin

FA0: FullAdder port map (A => A(0), B => B(0), CIN => CIN, S => S(0), COUT => C0_1);
FA1: FullAdder port map (A => A(1), B => B(1), CIN => C0_1, S => S(1), COUT => C1_2);
FA2: FullAdder port map (A => A(2), B => B(2), CIN => C1_2, S => S(2), COUT => C2_3);
FA3: FullAdder port map (A => A(3), B => B(3), CIN => C2_3, S => S(3), COUT => C3_4);
FA4: FullAdder port map (A => A(4), B => B(4), CIN => C3_4, S => S(4), COUT => C4_5);
FA5: FullAdder port map (A => A(5), B => B(5), CIN => C4_5, S => S(5), COUT => C5_6);
FA6: FullAdder port map (A => A(6), B => B(6), CIN => C5_6, S => S(6), COUT => C6_7);
FA7: FullAdder port map (A => A(7), B => B(7), CIN => C6_7, S => S(7), COUT => C7_8);
FA8: FullAdder port map (A => A(8), B => B(8), CIN => C7_8, S => S(8), COUT => C8_9);
FA9: FullAdder port map (A => A(9), B => B(9), CIN => C8_9, S => S(9), COUT => C9_10);
FA10: FullAdder port map (A => A(10), B => B(10), CIN => C9_10, S => S(10), COUT => C10_11);
FA11: FullAdder port map (A => A(11), B => B(11), CIN => C10_11, S => S(11), COUT => C11_12);
FA12: FullAdder port map (A => A(12), B => B(12), CIN => C11_12, S => S(12), COUT => C12_13);
FA13: FullAdder port map (A => A(13), B => B(13), CIN => C12_13, S => S(13), COUT => C13_14);
FA14: FullAdder port map (A => A(14), B => B(14), CIN => C13_14, S => S(14), COUT => C14_15);
FA15: FullAdder port map (A => A(15), B => B(15), CIN => C14_15, S => S(15), COUT => C15_16);
FA16: FullAdder port map (A => A(16), B => B(16), CIN => C15_16, S => S(16), COUT => C16_17);
FA17: FullAdder port map (A => A(17), B => B(17), CIN => C16_17, S => S(17), COUT => C17_18);
FA18: FullAdder port map (A => A(18), B => B(18), CIN => C17_18, S => S(18), COUT => C18_19);
FA19: FullAdder port map (A => A(19), B => B(19), CIN => C18_19, S => S(19), COUT => C19_20);
FA20: FullAdder port map (A => A(20), B => B(20), CIN => C19_20, S => S(20), COUT => C20_21);
FA21: FullAdder port map (A => A(21), B => B(21), CIN => C20_21, S => S(21), COUT => C21_22);
FA22: FullAdder port map (A => A(22), B => B(22), CIN => C21_22, S => S(22), COUT => C22_23);
FA23: FullAdder port map (A => A(23), B => B(23), CIN => C22_23, S => S(23), COUT => C23_24);
FA24: FullAdder port map (A => A(24), B => B(24), CIN => C23_24, S => S(24), COUT => C24_25);
FA25: FullAdder port map (A => A(25), B => B(25), CIN => C24_25, S => S(25), COUT => C25_26);
FA26: FullAdder port map (A => A(26), B => B(26), CIN => C25_26, S => S(26), COUT => C26_27);
FA27: FullAdder port map (A => A(27), B => B(27), CIN => C26_27, S => S(27), COUT => C27_28);
FA28: FullAdder port map (A => A(28), B => B(28), CIN => C27_28, S => S(28), COUT => C28_29);
FA29: FullAdder port map (A => A(29), B => B(29), CIN => C28_29, S => S(29), COUT => C29_30);
FA30: FullAdder port map (A => A(30), B => B(30), CIN => C29_30, S => S(30), COUT => C30_31);
FA31: FullAdder port map (A => A(31), B => B(31), CIN => C30_31, S => S(31), COUT => COUT);

end Behavioral;