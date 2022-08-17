-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2.2 (win64) Build 2348494 Mon Oct  1 18:25:44 MDT 2018
-- Date        : Mon Dec 10 14:29:15 2018
-- Host        : TheFallenPC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               D:/Projects/Vivado/Final_Project/Final_Project.sim/sim_1/impl/func/xsim/Sim_vm_func_impl.vhd
-- Design      : Vending_Machine
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Vending_Machine is
  port (
    clk : in STD_LOGIC;
    rst_c : in STD_LOGIC;
    rst_m : in STD_LOGIC;
    money : in STD_LOGIC_VECTOR ( 2 downto 0 );
    change : out STD_LOGIC_VECTOR ( 2 downto 0 );
    change_r : in STD_LOGIC;
    can : out STD_LOGIC;
    r_can : in STD_LOGIC;
    can_r : in STD_LOGIC;
    empty : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Vending_Machine : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of Vending_Machine : entity is "5e98fd1d";
end Vending_Machine;

architecture STRUCTURE of Vending_Machine is
  signal buying : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \buying_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \buying_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \buying_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \buying_reg[1]_i_3_n_0\ : STD_LOGIC;
  signal can_OBUF : STD_LOGIC;
  signal can_r_IBUF : STD_LOGIC;
  signal can_reg_i_1_n_0 : STD_LOGIC;
  signal can_reg_i_2_n_0 : STD_LOGIC;
  signal cans : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \cans_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \cans_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \cans_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \cans_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal change_OBUF : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal change_r_IBUF : STD_LOGIC;
  signal \change_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \change_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \change_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \change_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \change_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \change_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \change_reg[2]_i_3_n_0\ : STD_LOGIC;
  signal \change_reg[2]_i_4_n_0\ : STD_LOGIC;
  signal \change_reg[2]_i_5_n_0\ : STD_LOGIC;
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal empty_OBUF : STD_LOGIC;
  signal empty_reg_i_1_n_0 : STD_LOGIC;
  signal empty_reg_i_2_n_0 : STD_LOGIC;
  signal money_IBUF : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal money_in : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \money_in_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \money_in_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \money_in_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \money_in_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \money_in_reg[2]_i_3_n_0\ : STD_LOGIC;
  signal \money_in_reg[2]_i_4_n_0\ : STD_LOGIC;
  signal r_can_IBUF : STD_LOGIC;
  signal rst_c_IBUF : STD_LOGIC;
  signal rst_m_IBUF : STD_LOGIC;
  signal rst_m_IBUF_BUFG : STD_LOGIC;
  signal \state[1]_i_1_n_0\ : STD_LOGIC;
  signal state_n : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state_n_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \state_n_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \state_n_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \state_n_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \state_n_reg[2]_i_3_n_0\ : STD_LOGIC;
  signal \state_n_reg[2]_i_4_n_0\ : STD_LOGIC;
  signal \state_reg[2]_C_n_0\ : STD_LOGIC;
  signal \state_reg[2]_LDC_i_1_n_0\ : STD_LOGIC;
  signal \state_reg[2]_LDC_n_0\ : STD_LOGIC;
  signal \state_reg[2]_P_n_0\ : STD_LOGIC;
  signal \state_reg_n_0_[0]\ : STD_LOGIC;
  signal \state_reg_n_0_[1]\ : STD_LOGIC;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \buying_reg[0]\ : label is "LD";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \buying_reg[0]_i_1\ : label is "soft_lutpair1";
  attribute XILINX_LEGACY_PRIM of \buying_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of can_reg : label is "LD";
  attribute SOFT_HLUTNM of can_reg_i_1 : label is "soft_lutpair0";
  attribute XILINX_LEGACY_PRIM of \cans_reg[0]\ : label is "LD";
  attribute SOFT_HLUTNM of \cans_reg[0]_i_1\ : label is "soft_lutpair3";
  attribute XILINX_LEGACY_PRIM of \cans_reg[1]\ : label is "LD";
  attribute SOFT_HLUTNM of \cans_reg[1]_i_1\ : label is "soft_lutpair4";
  attribute XILINX_LEGACY_PRIM of \cans_reg[2]\ : label is "LD";
  attribute SOFT_HLUTNM of \cans_reg[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \cans_reg[2]_i_2\ : label is "soft_lutpair0";
  attribute XILINX_LEGACY_PRIM of \change_reg[0]\ : label is "LD";
  attribute SOFT_HLUTNM of \change_reg[0]_i_2\ : label is "soft_lutpair2";
  attribute XILINX_LEGACY_PRIM of \change_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \change_reg[2]\ : label is "LD";
  attribute SOFT_HLUTNM of \change_reg[2]_i_4\ : label is "soft_lutpair1";
  attribute XILINX_LEGACY_PRIM of empty_reg : label is "LD";
  attribute XILINX_LEGACY_PRIM of \money_in_reg[0]\ : label is "LD";
  attribute SOFT_HLUTNM of \money_in_reg[0]_i_1\ : label is "soft_lutpair3";
  attribute XILINX_LEGACY_PRIM of \money_in_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \money_in_reg[2]\ : label is "LD";
  attribute SOFT_HLUTNM of \money_in_reg[2]_i_4\ : label is "soft_lutpair2";
  attribute XILINX_LEGACY_PRIM of \state_n_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \state_n_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \state_n_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \state_reg[2]_LDC\ : label is "LDC";
begin
\buying_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \buying_reg[0]_i_1_n_0\,
      G => \buying_reg[1]_i_2_n_0\,
      GE => '1',
      Q => buying(0)
    );
\buying_reg[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000047FF"
    )
        port map (
      I0 => \state_reg[2]_P_n_0\,
      I1 => \state_reg[2]_LDC_n_0\,
      I2 => \state_reg[2]_C_n_0\,
      I3 => buying(0),
      I4 => \state_reg_n_0_[0]\,
      O => \buying_reg[0]_i_1_n_0\
    );
\buying_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \buying_reg[1]_i_1_n_0\,
      G => \buying_reg[1]_i_2_n_0\,
      GE => '1',
      Q => buying(1)
    );
\buying_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888FFF888F8"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state_reg_n_0_[0]\,
      I2 => \state_reg[2]_C_n_0\,
      I3 => \state_reg[2]_LDC_n_0\,
      I4 => \state_reg[2]_P_n_0\,
      I5 => buying(0),
      O => \buying_reg[1]_i_1_n_0\
    );
\buying_reg[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0073004003800380"
    )
        port map (
      I0 => buying(1),
      I1 => \state_reg_n_0_[0]\,
      I2 => buying(0),
      I3 => \change_reg[2]_i_4_n_0\,
      I4 => \buying_reg[1]_i_3_n_0\,
      I5 => \state_reg_n_0_[1]\,
      O => \buying_reg[1]_i_2_n_0\
    );
\buying_reg[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000555400000000"
    )
        port map (
      I0 => buying(0),
      I1 => cans(2),
      I2 => cans(0),
      I3 => cans(1),
      I4 => buying(1),
      I5 => r_can_IBUF,
      O => \buying_reg[1]_i_3_n_0\
    );
can_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => can_OBUF,
      O => can
    );
can_r_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => can_r,
      O => can_r_IBUF
    );
can_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => can_reg_i_1_n_0,
      G => can_reg_i_2_n_0,
      GE => '1',
      Q => can_OBUF
    );
can_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => \change_reg[2]_i_4_n_0\,
      I1 => buying(1),
      I2 => buying(0),
      I3 => \state_reg_n_0_[1]\,
      I4 => \state_reg_n_0_[0]\,
      O => can_reg_i_1_n_0
    );
can_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000080"
    )
        port map (
      I0 => \state_reg_n_0_[0]\,
      I1 => \state_reg_n_0_[1]\,
      I2 => buying(0),
      I3 => buying(1),
      I4 => \change_reg[2]_i_4_n_0\,
      I5 => can_r_IBUF,
      O => can_reg_i_2_n_0
    );
\cans_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '1'
    )
        port map (
      CLR => '0',
      D => \cans_reg[0]_i_1_n_0\,
      G => \cans_reg[2]_i_2_n_0\,
      GE => '1',
      Q => cans(0)
    );
\cans_reg[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => cans(0),
      I1 => \state_reg_n_0_[0]\,
      O => \cans_reg[0]_i_1_n_0\
    );
\cans_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '1'
    )
        port map (
      CLR => '0',
      D => \cans_reg[1]_i_1_n_0\,
      G => \cans_reg[2]_i_2_n_0\,
      GE => '1',
      Q => cans(1)
    );
\cans_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9F"
    )
        port map (
      I0 => cans(1),
      I1 => cans(0),
      I2 => \state_reg_n_0_[0]\,
      O => \cans_reg[1]_i_1_n_0\
    );
\cans_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \cans_reg[2]_i_1_n_0\,
      G => \cans_reg[2]_i_2_n_0\,
      GE => '1',
      Q => cans(2)
    );
\cans_reg[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E100"
    )
        port map (
      I0 => cans(1),
      I1 => cans(0),
      I2 => cans(2),
      I3 => \state_reg_n_0_[1]\,
      O => \cans_reg[2]_i_1_n_0\
    );
\cans_reg[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000200F"
    )
        port map (
      I0 => buying(0),
      I1 => buying(1),
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => \change_reg[2]_i_4_n_0\,
      O => \cans_reg[2]_i_2_n_0\
    );
\change_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => change_OBUF(0),
      O => change(0)
    );
\change_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => change_OBUF(1),
      O => change(1)
    );
\change_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => change_OBUF(2),
      O => change(2)
    );
change_r_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => change_r,
      O => change_r_IBUF
    );
\change_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \change_reg[0]_i_1_n_0\,
      G => \change_reg[2]_i_2_n_0\,
      GE => '1',
      Q => change_OBUF(0)
    );
\change_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000030008080808"
    )
        port map (
      I0 => \change_reg[0]_i_2_n_0\,
      I1 => \state_reg_n_0_[0]\,
      I2 => \state_reg_n_0_[1]\,
      I3 => money_in(0),
      I4 => buying(0),
      I5 => \change_reg[2]_i_4_n_0\,
      O => \change_reg[0]_i_1_n_0\
    );
\change_reg[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => money_in(1),
      I1 => money_IBUF(0),
      I2 => money_IBUF(1),
      I3 => money_in(2),
      O => \change_reg[0]_i_2_n_0\
    );
\change_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \change_reg[1]_i_1_n_0\,
      G => \change_reg[2]_i_2_n_0\,
      GE => '1',
      Q => change_OBUF(1)
    );
\change_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000030088888888"
    )
        port map (
      I0 => \change_reg[1]_i_2_n_0\,
      I1 => \state_reg_n_0_[0]\,
      I2 => \state_reg_n_0_[1]\,
      I3 => money_in(1),
      I4 => buying(0),
      I5 => \change_reg[2]_i_4_n_0\,
      O => \change_reg[1]_i_1_n_0\
    );
\change_reg[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000440040"
    )
        port map (
      I0 => money_in(2),
      I1 => money_IBUF(1),
      I2 => money_IBUF(0),
      I3 => money_in(1),
      I4 => money_IBUF(2),
      I5 => \state_reg_n_0_[1]\,
      O => \change_reg[1]_i_2_n_0\
    );
\change_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \change_reg[2]_i_1_n_0\,
      G => \change_reg[2]_i_2_n_0\,
      GE => '1',
      Q => change_OBUF(2)
    );
\change_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000030088888888"
    )
        port map (
      I0 => \change_reg[2]_i_3_n_0\,
      I1 => \state_reg_n_0_[0]\,
      I2 => \state_reg_n_0_[1]\,
      I3 => money_in(2),
      I4 => buying(0),
      I5 => \change_reg[2]_i_4_n_0\,
      O => \change_reg[2]_i_1_n_0\
    );
\change_reg[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF55020002"
    )
        port map (
      I0 => \change_reg[2]_i_4_n_0\,
      I1 => buying(0),
      I2 => \state_reg_n_0_[1]\,
      I3 => \state_reg_n_0_[0]\,
      I4 => \change_reg[2]_i_5_n_0\,
      I5 => change_r_IBUF,
      O => \change_reg[2]_i_2_n_0\
    );
\change_reg[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000002022"
    )
        port map (
      I0 => money_IBUF(2),
      I1 => money_in(1),
      I2 => money_IBUF(1),
      I3 => money_IBUF(0),
      I4 => money_in(2),
      I5 => \state_reg_n_0_[1]\,
      O => \change_reg[2]_i_3_n_0\
    );
\change_reg[2]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \state_reg[2]_P_n_0\,
      I1 => \state_reg[2]_LDC_n_0\,
      I2 => \state_reg[2]_C_n_0\,
      O => \change_reg[2]_i_4_n_0\
    );
\change_reg[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000450040"
    )
        port map (
      I0 => money_in(2),
      I1 => money_IBUF(1),
      I2 => money_IBUF(0),
      I3 => money_in(1),
      I4 => money_IBUF(2),
      I5 => \state_reg_n_0_[1]\,
      O => \change_reg[2]_i_5_n_0\
    );
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
empty_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => empty_OBUF,
      O => empty
    );
empty_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => empty_reg_i_1_n_0,
      G => empty_reg_i_2_n_0,
      GE => '1',
      Q => empty_OBUF
    );
empty_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000F0000000E"
    )
        port map (
      I0 => \state_reg_n_0_[0]\,
      I1 => \change_reg[2]_i_4_n_0\,
      I2 => cans(2),
      I3 => cans(1),
      I4 => cans(0),
      I5 => \state_reg_n_0_[1]\,
      O => empty_reg_i_1_n_0
    );
empty_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000F1111111F"
    )
        port map (
      I0 => \state_reg_n_0_[0]\,
      I1 => \change_reg[2]_i_4_n_0\,
      I2 => cans(2),
      I3 => cans(1),
      I4 => cans(0),
      I5 => \state_reg_n_0_[1]\,
      O => empty_reg_i_2_n_0
    );
\money_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => money(0),
      O => money_IBUF(0)
    );
\money_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => money(1),
      O => money_IBUF(1)
    );
\money_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => money(2),
      O => money_IBUF(2)
    );
\money_in_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \money_in_reg[0]_i_1_n_0\,
      G => \money_in_reg[2]_i_2_n_0\,
      GE => '1',
      Q => money_in(0)
    );
\money_in_reg[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C600"
    )
        port map (
      I0 => money_IBUF(0),
      I1 => money_in(0),
      I2 => \state_reg_n_0_[1]\,
      I3 => \state_reg_n_0_[0]\,
      O => \money_in_reg[0]_i_1_n_0\
    );
\money_in_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \money_in_reg[1]_i_1_n_0\,
      G => \money_in_reg[2]_i_2_n_0\,
      GE => '1',
      Q => money_in(1)
    );
\money_in_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333966600000000"
    )
        port map (
      I0 => money_IBUF(1),
      I1 => money_in(1),
      I2 => money_in(0),
      I3 => money_IBUF(0),
      I4 => \state_reg_n_0_[1]\,
      I5 => \state_reg_n_0_[0]\,
      O => \money_in_reg[1]_i_1_n_0\
    );
\money_in_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \money_in_reg[2]_i_1_n_0\,
      G => \money_in_reg[2]_i_2_n_0\,
      GE => '1',
      Q => money_in(2)
    );
\money_in_reg[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E22E0000"
    )
        port map (
      I0 => \money_in_reg[2]_i_3_n_0\,
      I1 => \state_reg_n_0_[1]\,
      I2 => money_in(1),
      I3 => money_in(2),
      I4 => \state_reg_n_0_[0]\,
      O => \money_in_reg[2]_i_1_n_0\
    );
\money_in_reg[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000F30A000A0"
    )
        port map (
      I0 => \money_in_reg[2]_i_4_n_0\,
      I1 => buying(1),
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => buying(0),
      I5 => \change_reg[2]_i_4_n_0\,
      O => \money_in_reg[2]_i_2_n_0\
    );
\money_in_reg[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999966696666666"
    )
        port map (
      I0 => money_IBUF(2),
      I1 => money_in(2),
      I2 => money_IBUF(0),
      I3 => money_in(0),
      I4 => money_IBUF(1),
      I5 => money_in(1),
      O => \money_in_reg[2]_i_3_n_0\
    );
\money_in_reg[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000310"
    )
        port map (
      I0 => money_IBUF(2),
      I1 => money_in(1),
      I2 => money_IBUF(1),
      I3 => money_IBUF(0),
      I4 => money_in(2),
      O => \money_in_reg[2]_i_4_n_0\
    );
r_can_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => r_can,
      O => r_can_IBUF
    );
rst_c_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => rst_c,
      O => rst_c_IBUF
    );
rst_m_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => rst_m_IBUF,
      O => rst_m_IBUF_BUFG
    );
rst_m_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => rst_m,
      O => rst_m_IBUF
    );
\state[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rst_c_IBUF,
      I1 => rst_m_IBUF,
      O => \state[1]_i_1_n_0\
    );
\state_n_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \state_n_reg[0]_i_1_n_0\,
      G => \state_n_reg[2]_i_2_n_0\,
      GE => '1',
      Q => state_n(0)
    );
\state_n_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000005555AAA8"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => cans(1),
      I2 => cans(0),
      I3 => cans(2),
      I4 => \change_reg[2]_i_4_n_0\,
      I5 => \state_reg_n_0_[0]\,
      O => \state_n_reg[0]_i_1_n_0\
    );
\state_n_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \state_n_reg[1]_i_1_n_0\,
      G => \state_n_reg[2]_i_2_n_0\,
      GE => '1',
      Q => state_n(1)
    );
\state_n_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000066666662"
    )
        port map (
      I0 => \state_reg_n_0_[0]\,
      I1 => \state_reg_n_0_[1]\,
      I2 => cans(1),
      I3 => cans(0),
      I4 => cans(2),
      I5 => \change_reg[2]_i_4_n_0\,
      O => \state_n_reg[1]_i_1_n_0\
    );
\state_n_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \state_n_reg[2]_i_1_n_0\,
      G => \state_n_reg[2]_i_2_n_0\,
      GE => '1',
      Q => state_n(2)
    );
\state_n_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000009999999D"
    )
        port map (
      I0 => \state_reg_n_0_[0]\,
      I1 => \state_reg_n_0_[1]\,
      I2 => cans(0),
      I3 => cans(1),
      I4 => cans(2),
      I5 => \change_reg[2]_i_4_n_0\,
      O => \state_n_reg[2]_i_1_n_0\
    );
\state_n_reg[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCFFBBBBFCFF8888"
    )
        port map (
      I0 => \state_n_reg[2]_i_3_n_0\,
      I1 => \state_reg_n_0_[0]\,
      I2 => \state_reg_n_0_[1]\,
      I3 => buying(0),
      I4 => \change_reg[2]_i_4_n_0\,
      I5 => \state_n_reg[2]_i_4_n_0\,
      O => \state_n_reg[2]_i_2_n_0\
    );
\state_n_reg[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2F2F2F20"
    )
        port map (
      I0 => buying(0),
      I1 => buying(1),
      I2 => \state_reg_n_0_[1]\,
      I3 => money_in(1),
      I4 => money_in(2),
      O => \state_n_reg[2]_i_3_n_0\
    );
\state_n_reg[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02FF"
    )
        port map (
      I0 => r_can_IBUF,
      I1 => buying(1),
      I2 => buying(0),
      I3 => \state_reg_n_0_[1]\,
      O => \state_n_reg[2]_i_4_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => \state[1]_i_1_n_0\,
      D => state_n(0),
      Q => \state_reg_n_0_[0]\
    );
\state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => \state[1]_i_1_n_0\,
      D => state_n(1),
      Q => \state_reg_n_0_[1]\
    );
\state_reg[2]_C\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => \state_reg[2]_LDC_i_1_n_0\,
      D => state_n(2),
      Q => \state_reg[2]_C_n_0\
    );
\state_reg[2]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \state_reg[2]_LDC_i_1_n_0\,
      D => '1',
      G => rst_m_IBUF_BUFG,
      GE => '1',
      Q => \state_reg[2]_LDC_n_0\
    );
\state_reg[2]_LDC_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rst_c_IBUF,
      I1 => rst_m_IBUF,
      O => \state_reg[2]_LDC_i_1_n_0\
    );
\state_reg[2]_P\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => state_n(2),
      PRE => rst_m_IBUF_BUFG,
      Q => \state_reg[2]_P_n_0\
    );
end STRUCTURE;
