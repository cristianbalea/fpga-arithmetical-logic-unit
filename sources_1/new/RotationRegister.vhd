library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RotationRegister is
    port ( A : in std_logic_vector (31 downto 0);
           CLK : in std_logic;
           DIR : in std_logic;
           LOAD: in std_logic;
           Y : out std_logic_vector (31 downto 0));
end RotationRegister;

architecture Behavioral of RotationRegister is

component ThreeStateBuffer is
    Port ( A : in STD_LOGIC;
           ENABLE : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;

component Mux2_1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;

component bistabilD is
    Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Reset : in std_logic;
           Set : in std_logic;
           Q : out STD_LOGIC);
end component;

component Demux1_2 is
    Port ( Y : in STD_LOGIC;
           S : in STD_LOGIC;
           A : out STD_LOGIC;
           B : out STD_LOGIC);
end component;

signal SetResetSel : std_logic_vector (31 downto 0);
signal Resets : std_logic_vector (31 downto 0);
signal Sets : std_logic_vector (31 downto 0);
signal Qs : std_logic_vector (31 downto 0);
signal MUXs : std_logic_vector (31 downto 0);

begin

Comp3StBuff0: ThreeStateBuffer port map (A => A(0), ENABLE => LOAD, Y => SetResetSel(0));
Comp3StBuff1: ThreeStateBuffer port map (A => A(1), ENABLE => LOAD, Y => SetResetSel(1));
Comp3StBuff2: ThreeStateBuffer port map (A => A(2), ENABLE => LOAD, Y => SetResetSel(2));
Comp3StBuff3: ThreeStateBuffer port map (A => A(3), ENABLE => LOAD, Y => SetResetSel(3));
Comp3StBuff4: ThreeStateBuffer port map (A => A(4), ENABLE => LOAD, Y => SetResetSel(4));
Comp3StBuff5: ThreeStateBuffer port map (A => A(5), ENABLE => LOAD, Y => SetResetSel(5));
Comp3StBuff6: ThreeStateBuffer port map (A => A(6), ENABLE => LOAD, Y => SetResetSel(6));
Comp3StBuff7: ThreeStateBuffer port map (A => A(7), ENABLE => LOAD, Y => SetResetSel(7));
Comp3StBuff8: ThreeStateBuffer port map (A => A(8), ENABLE => LOAD, Y => SetResetSel(8));
Comp3StBuff9: ThreeStateBuffer port map (A => A(9), ENABLE => LOAD, Y => SetResetSel(9));
Comp3StBuff10: ThreeStateBuffer port map (A => A(10), ENABLE => LOAD, Y => SetResetSel(10));
Comp3StBuff11: ThreeStateBuffer port map (A => A(11), ENABLE => LOAD, Y => SetResetSel(11));
Comp3StBuff12: ThreeStateBuffer port map (A => A(12), ENABLE => LOAD, Y => SetResetSel(12));
Comp3StBuff13: ThreeStateBuffer port map (A => A(13), ENABLE => LOAD, Y => SetResetSel(13));
Comp3StBuff14: ThreeStateBuffer port map (A => A(14), ENABLE => LOAD, Y => SetResetSel(14));
Comp3StBuff15: ThreeStateBuffer port map (A => A(15), ENABLE => LOAD, Y => SetResetSel(15));
Comp3StBuff16: ThreeStateBuffer port map (A => A(16), ENABLE => LOAD, Y => SetResetSel(16));
Comp3StBuff17: ThreeStateBuffer port map (A => A(17), ENABLE => LOAD, Y => SetResetSel(17));
Comp3StBuff18: ThreeStateBuffer port map (A => A(18), ENABLE => LOAD, Y => SetResetSel(18));
Comp3StBuff19: ThreeStateBuffer port map (A => A(19), ENABLE => LOAD, Y => SetResetSel(19));
Comp3StBuff20: ThreeStateBuffer port map (A => A(20), ENABLE => LOAD, Y => SetResetSel(20));
Comp3StBuff21: ThreeStateBuffer port map (A => A(21), ENABLE => LOAD, Y => SetResetSel(21));
Comp3StBuff22: ThreeStateBuffer port map (A => A(22), ENABLE => LOAD, Y => SetResetSel(22));
Comp3StBuff23: ThreeStateBuffer port map (A => A(23), ENABLE => LOAD, Y => SetResetSel(23));
Comp3StBuff24: ThreeStateBuffer port map (A => A(24), ENABLE => LOAD, Y => SetResetSel(24));
Comp3StBuff25: ThreeStateBuffer port map (A => A(25), ENABLE => LOAD, Y => SetResetSel(25));
Comp3StBuff26: ThreeStateBuffer port map (A => A(26), ENABLE => LOAD, Y => SetResetSel(26));
Comp3StBuff27: ThreeStateBuffer port map (A => A(27), ENABLE => LOAD, Y => SetResetSel(27));
Comp3StBuff28: ThreeStateBuffer port map (A => A(28), ENABLE => LOAD, Y => SetResetSel(28));
Comp3StBuff29: ThreeStateBuffer port map (A => A(29), ENABLE => LOAD, Y => SetResetSel(29));
Comp3StBuff30: ThreeStateBuffer port map (A => A(30), ENABLE => LOAD, Y => SetResetSel(30));
Comp3StBuff31: ThreeStateBuffer port map (A => A(31), ENABLE => LOAD, Y => SetResetSel(31));
    
CompDmux0: Demux1_2 port map (Y => '1', S => SetResetSel(0), A => Resets(0), B => Sets(0));
CompDmux1: Demux1_2 port map (Y => '1', S => SetResetSel(1), A => Resets(1), B => Sets(1));
CompDmux2: Demux1_2 port map (Y => '1', S => SetResetSel(2), A => Resets(2), B => Sets(2));
CompDmux3: Demux1_2 port map (Y => '1', S => SetResetSel(3), A => Resets(3), B => Sets(3));
CompDmux4: Demux1_2 port map (Y => '1', S => SetResetSel(4), A => Resets(4), B => Sets(4));
CompDmux5: Demux1_2 port map (Y => '1', S => SetResetSel(5), A => Resets(5), B => Sets(5));
CompDmux6: Demux1_2 port map (Y => '1', S => SetResetSel(6), A => Resets(6), B => Sets(6));
CompDmux7: Demux1_2 port map (Y => '1', S => SetResetSel(7), A => Resets(7), B => Sets(7));
CompDmux8: Demux1_2 port map (Y => '1', S => SetResetSel(8), A => Resets(8), B => Sets(8));
CompDmux9: Demux1_2 port map (Y => '1', S => SetResetSel(9), A => Resets(9), B => Sets(9));
CompDmux10: Demux1_2 port map (Y => '1', S => SetResetSel(10), A => Resets(10), B => Sets(10));
CompDmux11: Demux1_2 port map (Y => '1', S => SetResetSel(11), A => Resets(11), B => Sets(11));
CompDmux12: Demux1_2 port map (Y => '1', S => SetResetSel(12), A => Resets(12), B => Sets(12));
CompDmux13: Demux1_2 port map (Y => '1', S => SetResetSel(13), A => Resets(13), B => Sets(13));
CompDmux14: Demux1_2 port map (Y => '1', S => SetResetSel(14), A => Resets(14), B => Sets(14));
CompDmux15: Demux1_2 port map (Y => '1', S => SetResetSel(15), A => Resets(15), B => Sets(15));
CompDmux16: Demux1_2 port map (Y => '1', S => SetResetSel(16), A => Resets(16), B => Sets(16));
CompDmux17: Demux1_2 port map (Y => '1', S => SetResetSel(17), A => Resets(17), B => Sets(17));
CompDmux18: Demux1_2 port map (Y => '1', S => SetResetSel(18), A => Resets(18), B => Sets(18));
CompDmux19: Demux1_2 port map (Y => '1', S => SetResetSel(19), A => Resets(19), B => Sets(19));
CompDmux20: Demux1_2 port map (Y => '1', S => SetResetSel(20), A => Resets(20), B => Sets(20));
CompDmux21: Demux1_2 port map (Y => '1', S => SetResetSel(21), A => Resets(21), B => Sets(21));
CompDmux22: Demux1_2 port map (Y => '1', S => SetResetSel(22), A => Resets(22), B => Sets(22));
CompDmux23: Demux1_2 port map (Y => '1', S => SetResetSel(23), A => Resets(23), B => Sets(23));
CompDmux24: Demux1_2 port map (Y => '1', S => SetResetSel(24), A => Resets(24), B => Sets(24));
CompDmux25: Demux1_2 port map (Y => '1', S => SetResetSel(25), A => Resets(25), B => Sets(25));
CompDmux26: Demux1_2 port map (Y => '1', S => SetResetSel(26), A => Resets(26), B => Sets(26));
CompDmux27: Demux1_2 port map (Y => '1', S => SetResetSel(27), A => Resets(27), B => Sets(27));
CompDmux28: Demux1_2 port map (Y => '1', S => SetResetSel(28), A => Resets(28), B => Sets(28));
CompDmux29: Demux1_2 port map (Y => '1', S => SetResetSel(29), A => Resets(29), B => Sets(29));
CompDmux30: Demux1_2 port map (Y => '1', S => SetResetSel(30), A => Resets(30), B => Sets(30));
CompDmux31: Demux1_2 port map (Y => '1', S => SetResetSel(31), A => Resets(31), B => Sets(31));


CompMux0: Mux2_1 port map (A => Qs(31), B => Qs(1), S => DIR, Y => MUXs(0));
CompMux1: Mux2_1 port map (A => Qs(0), B => Qs(2), S => DIR, Y => MUXs(1));
CompMux2: Mux2_1 port map (A => Qs(1), B => Qs(3), S => DIR, Y => MUXs(2));
CompMux3: Mux2_1 port map (A => Qs(2), B => Qs(4), S => DIR, Y => MUXs(3));
CompMux4: Mux2_1 port map (A => Qs(3), B => Qs(5), S => DIR, Y => MUXs(4));
CompMux5: Mux2_1 port map (A => Qs(4), B => Qs(6), S => DIR, Y => MUXs(5));
CompMux6: Mux2_1 port map (A => Qs(5), B => Qs(7), S => DIR, Y => MUXs(6));
CompMux7: Mux2_1 port map (A => Qs(6), B => Qs(8), S => DIR, Y => MUXs(7));
CompMux8: Mux2_1 port map (A => Qs(7), B => Qs(9), S => DIR, Y => MUXs(8));
CompMux9: Mux2_1 port map (A => Qs(8), B => Qs(10), S => DIR, Y => MUXs(9));
CompMux10: Mux2_1 port map (A => Qs(9), B => Qs(11), S => DIR, Y => MUXs(10));
CompMux11: Mux2_1 port map (A => Qs(10), B => Qs(12), S => DIR, Y => MUXs(11));
CompMux12: Mux2_1 port map (A => Qs(11), B => Qs(13), S => DIR, Y => MUXs(12));
CompMux13: Mux2_1 port map (A => Qs(12), B => Qs(14), S => DIR, Y => MUXs(13));
CompMux14: Mux2_1 port map (A => Qs(13), B => Qs(15), S => DIR, Y => MUXs(14));
CompMux15: Mux2_1 port map (A => Qs(14), B => Qs(16), S => DIR, Y => MUXs(15));
CompMux16: Mux2_1 port map (A => Qs(15), B => Qs(17), S => DIR, Y => MUXs(16));
CompMux17: Mux2_1 port map (A => Qs(16), B => Qs(18), S => DIR, Y => MUXs(17));
CompMux18: Mux2_1 port map (A => Qs(17), B => Qs(19), S => DIR, Y => MUXs(18));
CompMux19: Mux2_1 port map (A => Qs(18), B => Qs(20), S => DIR, Y => MUXs(19));
CompMux20: Mux2_1 port map (A => Qs(19), B => Qs(21), S => DIR, Y => MUXs(20));
CompMux21: Mux2_1 port map (A => Qs(20), B => Qs(22), S => DIR, Y => MUXs(21));
CompMux22: Mux2_1 port map (A => Qs(21), B => Qs(23), S => DIR, Y => MUXs(22));
CompMux23: Mux2_1 port map (A => Qs(22), B => Qs(24), S => DIR, Y => MUXs(23));
CompMux24: Mux2_1 port map (A => Qs(23), B => Qs(25), S => DIR, Y => MUXs(24));
CompMux25: Mux2_1 port map (A => Qs(24), B => Qs(26), S => DIR, Y => MUXs(25));
CompMux26: Mux2_1 port map (A => Qs(25), B => Qs(27), S => DIR, Y => MUXs(26));
CompMux27: Mux2_1 port map (A => Qs(26), B => Qs(28), S => DIR, Y => MUXs(27));
CompMux28: Mux2_1 port map (A => Qs(27), B => Qs(29), S => DIR, Y => MUXs(28));
CompMux29: Mux2_1 port map (A => Qs(28), B => Qs(30), S => DIR, Y => MUXs(29));
CompMux30: Mux2_1 port map (A => Qs(29), B => Qs(31), S => DIR, Y => MUXs(30));
CompMux31: Mux2_1 port map (A => Qs(30), B => Qs(0), S => DIR, Y => MUXs(31));



CompD0: bistabilD port map (D => MUXs(0), CLK => CLK, Reset => Resets(0), Set => Sets(0), Q => Qs(0));
CompD1: bistabilD port map (D => MUXs(1), CLK => CLK, Reset => Resets(1), Set => Sets(1), Q => Qs(1));
CompD2: bistabilD port map (D => MUXs(2), CLK => CLK, Reset => Resets(2), Set => Sets(2), Q => Qs(2));
CompD3: bistabilD port map (D => MUXs(3), CLK => CLK, Reset => Resets(3), Set => Sets(3), Q => Qs(3));
CompD4: bistabilD port map (D => MUXs(4), CLK => CLK, Reset => Resets(4), Set => Sets(4), Q => Qs(4));
CompD5: bistabilD port map (D => MUXs(5), CLK => CLK, Reset => Resets(5), Set => Sets(5), Q => Qs(5));
CompD6: bistabilD port map (D => MUXs(6), CLK => CLK, Reset => Resets(6), Set => Sets(6), Q => Qs(6));
CompD7: bistabilD port map (D => MUXs(7), CLK => CLK, Reset => Resets(7), Set => Sets(7), Q => Qs(7));
CompD8: bistabilD port map (D => MUXs(8), CLK => CLK, Reset => Resets(8), Set => Sets(8), Q => Qs(8));
CompD9: bistabilD port map (D => MUXs(9), CLK => CLK, Reset => Resets(9), Set => Sets(9), Q => Qs(9));
CompD10: bistabilD port map (D => MUXs(10), CLK => CLK, Reset => Resets(10), Set => Sets(10), Q => Qs(10));
CompD11: bistabilD port map (D => MUXs(11), CLK => CLK, Reset => Resets(11), Set => Sets(11), Q => Qs(11));
CompD12: bistabilD port map (D => MUXs(12), CLK => CLK, Reset => Resets(12), Set => Sets(12), Q => Qs(12));
CompD13: bistabilD port map (D => MUXs(13), CLK => CLK, Reset => Resets(13), Set => Sets(13), Q => Qs(13));
CompD14: bistabilD port map (D => MUXs(14), CLK => CLK, Reset => Resets(14), Set => Sets(14), Q => Qs(14));
CompD15: bistabilD port map (D => MUXs(15), CLK => CLK, Reset => Resets(15), Set => Sets(15), Q => Qs(15));
CompD16: bistabilD port map (D => MUXs(16), CLK => CLK, Reset => Resets(16), Set => Sets(16), Q => Qs(16));
CompD17: bistabilD port map (D => MUXs(17), CLK => CLK, Reset => Resets(17), Set => Sets(17), Q => Qs(17));
CompD18: bistabilD port map (D => MUXs(18), CLK => CLK, Reset => Resets(18), Set => Sets(18), Q => Qs(18));
CompD19: bistabilD port map (D => MUXs(19), CLK => CLK, Reset => Resets(19), Set => Sets(19), Q => Qs(19));
CompD20: bistabilD port map (D => MUXs(20), CLK => CLK, Reset => Resets(20), Set => Sets(20), Q => Qs(20));
CompD21: bistabilD port map (D => MUXs(21), CLK => CLK, Reset => Resets(21), Set => Sets(21), Q => Qs(21));
CompD22: bistabilD port map (D => MUXs(22), CLK => CLK, Reset => Resets(22), Set => Sets(22), Q => Qs(22));
CompD23: bistabilD port map (D => MUXs(23), CLK => CLK, Reset => Resets(23), Set => Sets(23), Q => Qs(23));
CompD24: bistabilD port map (D => MUXs(24), CLK => CLK, Reset => Resets(24), Set => Sets(24), Q => Qs(24));
CompD25: bistabilD port map (D => MUXs(25), CLK => CLK, Reset => Resets(25), Set => Sets(25), Q => Qs(25));
CompD26: bistabilD port map (D => MUXs(26), CLK => CLK, Reset => Resets(26), Set => Sets(26), Q => Qs(26));
CompD27: bistabilD port map (D => MUXs(27), CLK => CLK, Reset => Resets(27), Set => Sets(27), Q => Qs(27));
CompD28: bistabilD port map (D => MUXs(28), CLK => CLK, Reset => Resets(28), Set => Sets(28), Q => Qs(28));
CompD29: bistabilD port map (D => MUXs(29), CLK => CLK, Reset => Resets(29), Set => Sets(29), Q => Qs(29));
CompD30: bistabilD port map (D => MUXs(30), CLK => CLK, Reset => Resets(30), Set => Sets(30), Q => Qs(30));
CompD31: bistabilD port map (D => MUXs(31), CLK => CLK, Reset => Resets(31), Set => Sets(31), Q => Qs(31));


Y <= Qs;
        
end architecture;