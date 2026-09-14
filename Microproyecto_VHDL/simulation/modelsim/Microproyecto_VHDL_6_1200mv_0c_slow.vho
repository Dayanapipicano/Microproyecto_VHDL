-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "09/13/2026 22:02:02"

-- 
-- Device: Altera EP3C16U484C6 Package UFBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Microproyecto_VHDL IS
    PORT (
	clk : IN std_logic;
	start : IN std_logic;
	stop : IN std_logic;
	reset : IN std_logic;
	ssd_min : OUT std_logic_vector(6 DOWNTO 0);
	ssd_dec : OUT std_logic_vector(6 DOWNTO 0);
	ssd_uni : OUT std_logic_vector(6 DOWNTO 0)
	);
END Microproyecto_VHDL;

-- Design Ports Information
-- ssd_min[0]	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_min[1]	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_min[2]	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_min[3]	=>  Location: PIN_P4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_min[4]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_min[5]	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_min[6]	=>  Location: PIN_P7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_dec[0]	=>  Location: PIN_P5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_dec[1]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_dec[2]	=>  Location: PIN_V1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_dec[3]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_dec[4]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_dec[5]	=>  Location: PIN_N5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_dec[6]	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_uni[0]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_uni[1]	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_uni[2]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_uni[3]	=>  Location: PIN_W1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_uni[4]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_uni[5]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ssd_uni[6]	=>  Location: PIN_V2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- stop	=>  Location: PIN_Y1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Microproyecto_VHDL IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_stop : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_ssd_min : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_ssd_dec : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_ssd_uni : std_logic_vector(6 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ssd_min[0]~output_o\ : std_logic;
SIGNAL \ssd_min[1]~output_o\ : std_logic;
SIGNAL \ssd_min[2]~output_o\ : std_logic;
SIGNAL \ssd_min[3]~output_o\ : std_logic;
SIGNAL \ssd_min[4]~output_o\ : std_logic;
SIGNAL \ssd_min[5]~output_o\ : std_logic;
SIGNAL \ssd_min[6]~output_o\ : std_logic;
SIGNAL \ssd_dec[0]~output_o\ : std_logic;
SIGNAL \ssd_dec[1]~output_o\ : std_logic;
SIGNAL \ssd_dec[2]~output_o\ : std_logic;
SIGNAL \ssd_dec[3]~output_o\ : std_logic;
SIGNAL \ssd_dec[4]~output_o\ : std_logic;
SIGNAL \ssd_dec[5]~output_o\ : std_logic;
SIGNAL \ssd_dec[6]~output_o\ : std_logic;
SIGNAL \ssd_uni[0]~output_o\ : std_logic;
SIGNAL \ssd_uni[1]~output_o\ : std_logic;
SIGNAL \ssd_uni[2]~output_o\ : std_logic;
SIGNAL \ssd_uni[3]~output_o\ : std_logic;
SIGNAL \ssd_uni[4]~output_o\ : std_logic;
SIGNAL \ssd_uni[5]~output_o\ : std_logic;
SIGNAL \ssd_uni[6]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \contador_minutos|cuenta[0]~3_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \stop~input_o\ : std_logic;
SIGNAL \running~0_combout\ : std_logic;
SIGNAL \running~q\ : std_logic;
SIGNAL \contador_decenas|cuenta[0]~4_combout\ : std_logic;
SIGNAL \contador_unidades|cuenta[0]~3_combout\ : std_logic;
SIGNAL \contador_unidades|cuenta[2]~1_combout\ : std_logic;
SIGNAL \contador_unidades|cuenta~2_combout\ : std_logic;
SIGNAL \contador_unidades|cuenta~0_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \enable_min~1_combout\ : std_logic;
SIGNAL \contador_decenas|cuenta[3]~2_combout\ : std_logic;
SIGNAL \contador_decenas|cuenta[3]~3_combout\ : std_logic;
SIGNAL \contador_decenas|cuenta~1_combout\ : std_logic;
SIGNAL \contador_decenas|cuenta~0_combout\ : std_logic;
SIGNAL \contador_decenas|Equal0~0_combout\ : std_logic;
SIGNAL \enable_min~0_combout\ : std_logic;
SIGNAL \contador_minutos|cuenta[2]~1_combout\ : std_logic;
SIGNAL \contador_minutos|cuenta~2_combout\ : std_logic;
SIGNAL \contador_minutos|cuenta~0_combout\ : std_logic;
SIGNAL \decoder_minutos|Mux6~0_combout\ : std_logic;
SIGNAL \decoder_minutos|Mux5~0_combout\ : std_logic;
SIGNAL \decoder_minutos|Mux4~0_combout\ : std_logic;
SIGNAL \decoder_minutos|Mux3~0_combout\ : std_logic;
SIGNAL \decoder_minutos|Mux2~0_combout\ : std_logic;
SIGNAL \decoder_minutos|Mux1~0_combout\ : std_logic;
SIGNAL \decoder_minutos|Mux0~0_combout\ : std_logic;
SIGNAL \decoder_decenas|Mux6~0_combout\ : std_logic;
SIGNAL \decoder_decenas|Mux5~0_combout\ : std_logic;
SIGNAL \decoder_decenas|Mux4~0_combout\ : std_logic;
SIGNAL \decoder_decenas|Mux3~0_combout\ : std_logic;
SIGNAL \decoder_decenas|Mux2~0_combout\ : std_logic;
SIGNAL \decoder_decenas|Mux1~0_combout\ : std_logic;
SIGNAL \decoder_decenas|Mux0~0_combout\ : std_logic;
SIGNAL \decoder_unidades|Mux6~0_combout\ : std_logic;
SIGNAL \decoder_unidades|Mux5~0_combout\ : std_logic;
SIGNAL \decoder_unidades|Mux4~0_combout\ : std_logic;
SIGNAL \decoder_unidades|Mux3~0_combout\ : std_logic;
SIGNAL \decoder_unidades|Mux2~0_combout\ : std_logic;
SIGNAL \decoder_unidades|Mux1~0_combout\ : std_logic;
SIGNAL \decoder_unidades|Mux0~0_combout\ : std_logic;
SIGNAL \contador_minutos|cuenta\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \contador_unidades|cuenta\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \contador_decenas|cuenta\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \decoder_unidades|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \decoder_unidades|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \decoder_unidades|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \decoder_unidades|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \decoder_unidades|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \decoder_unidades|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \decoder_decenas|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \decoder_decenas|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \decoder_decenas|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \decoder_decenas|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \decoder_decenas|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \decoder_decenas|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \decoder_minutos|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \decoder_minutos|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \decoder_minutos|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \decoder_minutos|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \decoder_minutos|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \decoder_minutos|ALT_INV_Mux5~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_start <= start;
ww_stop <= stop;
ww_reset <= reset;
ssd_min <= ww_ssd_min;
ssd_dec <= ww_ssd_dec;
ssd_uni <= ww_ssd_uni;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\decoder_unidades|ALT_INV_Mux0~0_combout\ <= NOT \decoder_unidades|Mux0~0_combout\;
\decoder_unidades|ALT_INV_Mux1~0_combout\ <= NOT \decoder_unidades|Mux1~0_combout\;
\decoder_unidades|ALT_INV_Mux2~0_combout\ <= NOT \decoder_unidades|Mux2~0_combout\;
\decoder_unidades|ALT_INV_Mux3~0_combout\ <= NOT \decoder_unidades|Mux3~0_combout\;
\decoder_unidades|ALT_INV_Mux4~0_combout\ <= NOT \decoder_unidades|Mux4~0_combout\;
\decoder_unidades|ALT_INV_Mux5~0_combout\ <= NOT \decoder_unidades|Mux5~0_combout\;
\decoder_decenas|ALT_INV_Mux0~0_combout\ <= NOT \decoder_decenas|Mux0~0_combout\;
\decoder_decenas|ALT_INV_Mux1~0_combout\ <= NOT \decoder_decenas|Mux1~0_combout\;
\decoder_decenas|ALT_INV_Mux2~0_combout\ <= NOT \decoder_decenas|Mux2~0_combout\;
\decoder_decenas|ALT_INV_Mux3~0_combout\ <= NOT \decoder_decenas|Mux3~0_combout\;
\decoder_decenas|ALT_INV_Mux4~0_combout\ <= NOT \decoder_decenas|Mux4~0_combout\;
\decoder_decenas|ALT_INV_Mux5~0_combout\ <= NOT \decoder_decenas|Mux5~0_combout\;
\decoder_minutos|ALT_INV_Mux0~0_combout\ <= NOT \decoder_minutos|Mux0~0_combout\;
\decoder_minutos|ALT_INV_Mux1~0_combout\ <= NOT \decoder_minutos|Mux1~0_combout\;
\decoder_minutos|ALT_INV_Mux2~0_combout\ <= NOT \decoder_minutos|Mux2~0_combout\;
\decoder_minutos|ALT_INV_Mux3~0_combout\ <= NOT \decoder_minutos|Mux3~0_combout\;
\decoder_minutos|ALT_INV_Mux4~0_combout\ <= NOT \decoder_minutos|Mux4~0_combout\;
\decoder_minutos|ALT_INV_Mux5~0_combout\ <= NOT \decoder_minutos|Mux5~0_combout\;

-- Location: IOOBUF_X0_Y11_N9
\ssd_min[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_minutos|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \ssd_min[0]~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\ssd_min[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_minutos|ALT_INV_Mux5~0_combout\,
	devoe => ww_devoe,
	o => \ssd_min[1]~output_o\);

-- Location: IOOBUF_X0_Y10_N9
\ssd_min[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_minutos|ALT_INV_Mux4~0_combout\,
	devoe => ww_devoe,
	o => \ssd_min[2]~output_o\);

-- Location: IOOBUF_X0_Y10_N23
\ssd_min[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_minutos|ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => \ssd_min[3]~output_o\);

-- Location: IOOBUF_X0_Y9_N16
\ssd_min[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_minutos|ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => \ssd_min[4]~output_o\);

-- Location: IOOBUF_X0_Y6_N23
\ssd_min[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_minutos|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \ssd_min[5]~output_o\);

-- Location: IOOBUF_X0_Y5_N2
\ssd_min[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_minutos|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \ssd_min[6]~output_o\);

-- Location: IOOBUF_X0_Y8_N9
\ssd_dec[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_decenas|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \ssd_dec[0]~output_o\);

-- Location: IOOBUF_X0_Y10_N2
\ssd_dec[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_decenas|ALT_INV_Mux5~0_combout\,
	devoe => ww_devoe,
	o => \ssd_dec[1]~output_o\);

-- Location: IOOBUF_X0_Y8_N2
\ssd_dec[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_decenas|ALT_INV_Mux4~0_combout\,
	devoe => ww_devoe,
	o => \ssd_dec[2]~output_o\);

-- Location: IOOBUF_X0_Y8_N23
\ssd_dec[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_decenas|ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => \ssd_dec[3]~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\ssd_dec[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_decenas|ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => \ssd_dec[4]~output_o\);

-- Location: IOOBUF_X0_Y10_N16
\ssd_dec[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_decenas|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \ssd_dec[5]~output_o\);

-- Location: IOOBUF_X0_Y6_N2
\ssd_dec[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_decenas|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \ssd_dec[6]~output_o\);

-- Location: IOOBUF_X0_Y9_N9
\ssd_uni[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_unidades|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \ssd_uni[0]~output_o\);

-- Location: IOOBUF_X0_Y9_N2
\ssd_uni[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_unidades|ALT_INV_Mux5~0_combout\,
	devoe => ww_devoe,
	o => \ssd_uni[1]~output_o\);

-- Location: IOOBUF_X0_Y7_N9
\ssd_uni[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_unidades|ALT_INV_Mux4~0_combout\,
	devoe => ww_devoe,
	o => \ssd_uni[2]~output_o\);

-- Location: IOOBUF_X0_Y7_N23
\ssd_uni[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_unidades|ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => \ssd_uni[3]~output_o\);

-- Location: IOOBUF_X0_Y7_N16
\ssd_uni[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_unidades|ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => \ssd_uni[4]~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\ssd_uni[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_unidades|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \ssd_uni[5]~output_o\);

-- Location: IOOBUF_X0_Y9_N23
\ssd_uni[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder_unidades|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \ssd_uni[6]~output_o\);

-- Location: IOIBUF_X0_Y14_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X3_Y8_N24
\contador_minutos|cuenta[0]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_minutos|cuenta[0]~3_combout\ = !\contador_minutos|cuenta\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \contador_minutos|cuenta\(0),
	combout => \contador_minutos|cuenta[0]~3_combout\);

-- Location: IOIBUF_X0_Y14_N8
\reset~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G2
\reset~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y5_N15
\start~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: IOIBUF_X0_Y6_N8
\stop~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_stop,
	o => \stop~input_o\);

-- Location: LCCOMB_X4_Y8_N26
\running~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \running~0_combout\ = (\start~input_o\) # ((\running~q\ & !\stop~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datac => \running~q\,
	datad => \stop~input_o\,
	combout => \running~0_combout\);

-- Location: FF_X4_Y8_N27
running : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \running~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \running~q\);

-- Location: LCCOMB_X4_Y8_N28
\contador_decenas|cuenta[0]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_decenas|cuenta[0]~4_combout\ = !\contador_decenas|cuenta\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \contador_decenas|cuenta\(0),
	combout => \contador_decenas|cuenta[0]~4_combout\);

-- Location: LCCOMB_X5_Y8_N12
\contador_unidades|cuenta[0]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_unidades|cuenta[0]~3_combout\ = !\contador_unidades|cuenta\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \contador_unidades|cuenta\(0),
	combout => \contador_unidades|cuenta[0]~3_combout\);

-- Location: FF_X5_Y8_N13
\contador_unidades|cuenta[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_unidades|cuenta[0]~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \running~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_unidades|cuenta\(0));

-- Location: LCCOMB_X5_Y8_N4
\contador_unidades|cuenta[2]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_unidades|cuenta[2]~1_combout\ = \contador_unidades|cuenta\(2) $ (((\running~q\ & (\contador_unidades|cuenta\(1) & \contador_unidades|cuenta\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \running~q\,
	datab => \contador_unidades|cuenta\(1),
	datac => \contador_unidades|cuenta\(2),
	datad => \contador_unidades|cuenta\(0),
	combout => \contador_unidades|cuenta[2]~1_combout\);

-- Location: FF_X5_Y8_N5
\contador_unidades|cuenta[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_unidades|cuenta[2]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_unidades|cuenta\(2));

-- Location: LCCOMB_X5_Y8_N14
\contador_unidades|cuenta~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_unidades|cuenta~2_combout\ = (\contador_unidades|cuenta\(1) & (\contador_unidades|cuenta\(3) $ (((\contador_unidades|cuenta\(0) & \contador_unidades|cuenta\(2)))))) # (!\contador_unidades|cuenta\(1) & (\contador_unidades|cuenta\(3) & 
-- ((\contador_unidades|cuenta\(2)) # (!\contador_unidades|cuenta\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_unidades|cuenta\(1),
	datab => \contador_unidades|cuenta\(0),
	datac => \contador_unidades|cuenta\(3),
	datad => \contador_unidades|cuenta\(2),
	combout => \contador_unidades|cuenta~2_combout\);

-- Location: FF_X5_Y8_N15
\contador_unidades|cuenta[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_unidades|cuenta~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \running~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_unidades|cuenta\(3));

-- Location: LCCOMB_X5_Y8_N30
\contador_unidades|cuenta~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_unidades|cuenta~0_combout\ = (\contador_unidades|cuenta\(0) & (!\contador_unidades|cuenta\(1) & ((\contador_unidades|cuenta\(2)) # (!\contador_unidades|cuenta\(3))))) # (!\contador_unidades|cuenta\(0) & (((\contador_unidades|cuenta\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_unidades|cuenta\(3),
	datab => \contador_unidades|cuenta\(0),
	datac => \contador_unidades|cuenta\(1),
	datad => \contador_unidades|cuenta\(2),
	combout => \contador_unidades|cuenta~0_combout\);

-- Location: FF_X5_Y8_N31
\contador_unidades|cuenta[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_unidades|cuenta~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \running~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_unidades|cuenta\(1));

-- Location: LCCOMB_X5_Y8_N2
\Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\contador_unidades|cuenta\(1) & (!\contador_unidades|cuenta\(2) & (\contador_unidades|cuenta\(3) & \contador_unidades|cuenta\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_unidades|cuenta\(1),
	datab => \contador_unidades|cuenta\(2),
	datac => \contador_unidades|cuenta\(3),
	datad => \contador_unidades|cuenta\(0),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X5_Y8_N20
\enable_min~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \enable_min~1_combout\ = (\running~q\ & \Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \running~q\,
	datad => \Equal0~0_combout\,
	combout => \enable_min~1_combout\);

-- Location: FF_X4_Y8_N29
\contador_decenas|cuenta[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_decenas|cuenta[0]~4_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \enable_min~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_decenas|cuenta\(0));

-- Location: LCCOMB_X4_Y8_N6
\contador_decenas|cuenta[3]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_decenas|cuenta[3]~2_combout\ = (\contador_decenas|cuenta\(1) & (\contador_decenas|cuenta\(2) & \contador_decenas|cuenta\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_decenas|cuenta\(1),
	datac => \contador_decenas|cuenta\(2),
	datad => \contador_decenas|cuenta\(0),
	combout => \contador_decenas|cuenta[3]~2_combout\);

-- Location: LCCOMB_X4_Y8_N18
\contador_decenas|cuenta[3]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_decenas|cuenta[3]~3_combout\ = \contador_decenas|cuenta\(3) $ (((\contador_decenas|cuenta[3]~2_combout\ & (\running~q\ & \Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_decenas|cuenta[3]~2_combout\,
	datab => \running~q\,
	datac => \contador_decenas|cuenta\(3),
	datad => \Equal0~0_combout\,
	combout => \contador_decenas|cuenta[3]~3_combout\);

-- Location: FF_X4_Y8_N19
\contador_decenas|cuenta[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_decenas|cuenta[3]~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_decenas|cuenta\(3));

-- Location: LCCOMB_X4_Y8_N4
\contador_decenas|cuenta~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_decenas|cuenta~1_combout\ = (\contador_decenas|cuenta\(1) & ((\contador_decenas|cuenta\(2) $ (\contador_decenas|cuenta\(0))))) # (!\contador_decenas|cuenta\(1) & (\contador_decenas|cuenta\(2) & ((\contador_decenas|cuenta\(3)) # 
-- (!\contador_decenas|cuenta\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_decenas|cuenta\(1),
	datab => \contador_decenas|cuenta\(3),
	datac => \contador_decenas|cuenta\(2),
	datad => \contador_decenas|cuenta\(0),
	combout => \contador_decenas|cuenta~1_combout\);

-- Location: FF_X4_Y8_N5
\contador_decenas|cuenta[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_decenas|cuenta~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \enable_min~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_decenas|cuenta\(2));

-- Location: LCCOMB_X4_Y8_N22
\contador_decenas|cuenta~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_decenas|cuenta~0_combout\ = (\contador_decenas|cuenta\(1) & (((!\contador_decenas|cuenta\(0))))) # (!\contador_decenas|cuenta\(1) & (\contador_decenas|cuenta\(0) & ((\contador_decenas|cuenta\(3)) # (!\contador_decenas|cuenta\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_decenas|cuenta\(2),
	datab => \contador_decenas|cuenta\(3),
	datac => \contador_decenas|cuenta\(1),
	datad => \contador_decenas|cuenta\(0),
	combout => \contador_decenas|cuenta~0_combout\);

-- Location: FF_X4_Y8_N23
\contador_decenas|cuenta[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_decenas|cuenta~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \enable_min~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_decenas|cuenta\(1));

-- Location: LCCOMB_X4_Y8_N12
\contador_decenas|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_decenas|Equal0~0_combout\ = (!\contador_decenas|cuenta\(1) & (!\contador_decenas|cuenta\(3) & (\contador_decenas|cuenta\(2) & \contador_decenas|cuenta\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_decenas|cuenta\(1),
	datab => \contador_decenas|cuenta\(3),
	datac => \contador_decenas|cuenta\(2),
	datad => \contador_decenas|cuenta\(0),
	combout => \contador_decenas|Equal0~0_combout\);

-- Location: LCCOMB_X3_Y8_N18
\enable_min~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \enable_min~0_combout\ = (\running~q\ & (\contador_decenas|Equal0~0_combout\ & \Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \running~q\,
	datac => \contador_decenas|Equal0~0_combout\,
	datad => \Equal0~0_combout\,
	combout => \enable_min~0_combout\);

-- Location: FF_X3_Y8_N25
\contador_minutos|cuenta[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_minutos|cuenta[0]~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \enable_min~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_minutos|cuenta\(0));

-- Location: LCCOMB_X3_Y8_N12
\contador_minutos|cuenta[2]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_minutos|cuenta[2]~1_combout\ = \contador_minutos|cuenta\(2) $ (((\contador_minutos|cuenta\(1) & (\contador_minutos|cuenta\(0) & \enable_min~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_minutos|cuenta\(1),
	datab => \contador_minutos|cuenta\(0),
	datac => \contador_minutos|cuenta\(2),
	datad => \enable_min~0_combout\,
	combout => \contador_minutos|cuenta[2]~1_combout\);

-- Location: FF_X3_Y8_N13
\contador_minutos|cuenta[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_minutos|cuenta[2]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_minutos|cuenta\(2));

-- Location: LCCOMB_X3_Y8_N22
\contador_minutos|cuenta~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_minutos|cuenta~2_combout\ = (\contador_minutos|cuenta\(1) & (\contador_minutos|cuenta\(3) $ (((\contador_minutos|cuenta\(0) & \contador_minutos|cuenta\(2)))))) # (!\contador_minutos|cuenta\(1) & (\contador_minutos|cuenta\(3) & 
-- ((\contador_minutos|cuenta\(2)) # (!\contador_minutos|cuenta\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_minutos|cuenta\(1),
	datab => \contador_minutos|cuenta\(0),
	datac => \contador_minutos|cuenta\(3),
	datad => \contador_minutos|cuenta\(2),
	combout => \contador_minutos|cuenta~2_combout\);

-- Location: FF_X3_Y8_N23
\contador_minutos|cuenta[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_minutos|cuenta~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \enable_min~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_minutos|cuenta\(3));

-- Location: LCCOMB_X3_Y8_N26
\contador_minutos|cuenta~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_minutos|cuenta~0_combout\ = (\contador_minutos|cuenta\(0) & (!\contador_minutos|cuenta\(1) & ((\contador_minutos|cuenta\(2)) # (!\contador_minutos|cuenta\(3))))) # (!\contador_minutos|cuenta\(0) & (((\contador_minutos|cuenta\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_minutos|cuenta\(3),
	datab => \contador_minutos|cuenta\(0),
	datac => \contador_minutos|cuenta\(1),
	datad => \contador_minutos|cuenta\(2),
	combout => \contador_minutos|cuenta~0_combout\);

-- Location: FF_X3_Y8_N27
\contador_minutos|cuenta[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_minutos|cuenta~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \enable_min~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_minutos|cuenta\(1));

-- Location: LCCOMB_X3_Y8_N16
\decoder_minutos|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_minutos|Mux6~0_combout\ = (\contador_minutos|cuenta\(1) & (!\contador_minutos|cuenta\(3) & ((!\contador_minutos|cuenta\(2)) # (!\contador_minutos|cuenta\(0))))) # (!\contador_minutos|cuenta\(1) & ((\contador_minutos|cuenta\(3) $ 
-- (\contador_minutos|cuenta\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_minutos|cuenta\(1),
	datab => \contador_minutos|cuenta\(0),
	datac => \contador_minutos|cuenta\(3),
	datad => \contador_minutos|cuenta\(2),
	combout => \decoder_minutos|Mux6~0_combout\);

-- Location: LCCOMB_X3_Y8_N2
\decoder_minutos|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_minutos|Mux5~0_combout\ = (\contador_minutos|cuenta\(0) & ((\contador_minutos|cuenta\(1)) # (\contador_minutos|cuenta\(3) $ (!\contador_minutos|cuenta\(2))))) # (!\contador_minutos|cuenta\(0) & ((\contador_minutos|cuenta\(2) & 
-- ((\contador_minutos|cuenta\(3)))) # (!\contador_minutos|cuenta\(2) & (\contador_minutos|cuenta\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_minutos|cuenta\(1),
	datab => \contador_minutos|cuenta\(0),
	datac => \contador_minutos|cuenta\(3),
	datad => \contador_minutos|cuenta\(2),
	combout => \decoder_minutos|Mux5~0_combout\);

-- Location: LCCOMB_X3_Y8_N20
\decoder_minutos|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_minutos|Mux4~0_combout\ = (\contador_minutos|cuenta\(0)) # ((\contador_minutos|cuenta\(1) & (\contador_minutos|cuenta\(3))) # (!\contador_minutos|cuenta\(1) & ((\contador_minutos|cuenta\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_minutos|cuenta\(1),
	datab => \contador_minutos|cuenta\(0),
	datac => \contador_minutos|cuenta\(3),
	datad => \contador_minutos|cuenta\(2),
	combout => \decoder_minutos|Mux4~0_combout\);

-- Location: LCCOMB_X3_Y8_N14
\decoder_minutos|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_minutos|Mux3~0_combout\ = (\contador_minutos|cuenta\(1) & ((\contador_minutos|cuenta\(3)) # ((\contador_minutos|cuenta\(0) & \contador_minutos|cuenta\(2))))) # (!\contador_minutos|cuenta\(1) & (\contador_minutos|cuenta\(2) $ 
-- (((\contador_minutos|cuenta\(0) & !\contador_minutos|cuenta\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100110100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_minutos|cuenta\(1),
	datab => \contador_minutos|cuenta\(0),
	datac => \contador_minutos|cuenta\(3),
	datad => \contador_minutos|cuenta\(2),
	combout => \decoder_minutos|Mux3~0_combout\);

-- Location: LCCOMB_X3_Y8_N0
\decoder_minutos|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_minutos|Mux2~0_combout\ = (\contador_minutos|cuenta\(2) & (((\contador_minutos|cuenta\(3))))) # (!\contador_minutos|cuenta\(2) & (\contador_minutos|cuenta\(1) & ((\contador_minutos|cuenta\(3)) # (!\contador_minutos|cuenta\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_minutos|cuenta\(1),
	datab => \contador_minutos|cuenta\(0),
	datac => \contador_minutos|cuenta\(3),
	datad => \contador_minutos|cuenta\(2),
	combout => \decoder_minutos|Mux2~0_combout\);

-- Location: LCCOMB_X3_Y8_N30
\decoder_minutos|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_minutos|Mux1~0_combout\ = (\contador_minutos|cuenta\(3) & ((\contador_minutos|cuenta\(1)) # ((\contador_minutos|cuenta\(2))))) # (!\contador_minutos|cuenta\(3) & (\contador_minutos|cuenta\(2) & (\contador_minutos|cuenta\(1) $ 
-- (\contador_minutos|cuenta\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_minutos|cuenta\(1),
	datab => \contador_minutos|cuenta\(0),
	datac => \contador_minutos|cuenta\(3),
	datad => \contador_minutos|cuenta\(2),
	combout => \decoder_minutos|Mux1~0_combout\);

-- Location: LCCOMB_X3_Y8_N28
\decoder_minutos|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_minutos|Mux0~0_combout\ = (\contador_minutos|cuenta\(1) & (((\contador_minutos|cuenta\(3))))) # (!\contador_minutos|cuenta\(1) & (\contador_minutos|cuenta\(2) $ (((\contador_minutos|cuenta\(0) & !\contador_minutos|cuenta\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000110100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_minutos|cuenta\(1),
	datab => \contador_minutos|cuenta\(0),
	datac => \contador_minutos|cuenta\(3),
	datad => \contador_minutos|cuenta\(2),
	combout => \decoder_minutos|Mux0~0_combout\);

-- Location: LCCOMB_X4_Y8_N8
\decoder_decenas|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_decenas|Mux6~0_combout\ = (\contador_decenas|cuenta\(2) & (!\contador_decenas|cuenta\(3) & ((!\contador_decenas|cuenta\(0)) # (!\contador_decenas|cuenta\(1))))) # (!\contador_decenas|cuenta\(2) & (\contador_decenas|cuenta\(1) $ 
-- ((\contador_decenas|cuenta\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011000011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_decenas|cuenta\(2),
	datab => \contador_decenas|cuenta\(1),
	datac => \contador_decenas|cuenta\(3),
	datad => \contador_decenas|cuenta\(0),
	combout => \decoder_decenas|Mux6~0_combout\);

-- Location: LCCOMB_X4_Y8_N10
\decoder_decenas|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_decenas|Mux5~0_combout\ = (\contador_decenas|cuenta\(2) & ((\contador_decenas|cuenta\(3)) # ((\contador_decenas|cuenta\(1) & \contador_decenas|cuenta\(0))))) # (!\contador_decenas|cuenta\(2) & ((\contador_decenas|cuenta\(1)) # 
-- ((!\contador_decenas|cuenta\(3) & \contador_decenas|cuenta\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_decenas|cuenta\(2),
	datab => \contador_decenas|cuenta\(1),
	datac => \contador_decenas|cuenta\(3),
	datad => \contador_decenas|cuenta\(0),
	combout => \decoder_decenas|Mux5~0_combout\);

-- Location: LCCOMB_X4_Y8_N24
\decoder_decenas|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_decenas|Mux4~0_combout\ = (\contador_decenas|cuenta\(0)) # ((\contador_decenas|cuenta\(1) & ((\contador_decenas|cuenta\(3)))) # (!\contador_decenas|cuenta\(1) & (\contador_decenas|cuenta\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_decenas|cuenta\(2),
	datab => \contador_decenas|cuenta\(1),
	datac => \contador_decenas|cuenta\(3),
	datad => \contador_decenas|cuenta\(0),
	combout => \decoder_decenas|Mux4~0_combout\);

-- Location: LCCOMB_X4_Y8_N14
\decoder_decenas|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_decenas|Mux3~0_combout\ = (\contador_decenas|cuenta\(1) & ((\contador_decenas|cuenta\(3)) # ((\contador_decenas|cuenta\(2) & \contador_decenas|cuenta\(0))))) # (!\contador_decenas|cuenta\(1) & (\contador_decenas|cuenta\(2) $ 
-- (((!\contador_decenas|cuenta\(3) & \contador_decenas|cuenta\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_decenas|cuenta\(2),
	datab => \contador_decenas|cuenta\(1),
	datac => \contador_decenas|cuenta\(3),
	datad => \contador_decenas|cuenta\(0),
	combout => \decoder_decenas|Mux3~0_combout\);

-- Location: LCCOMB_X4_Y8_N16
\decoder_decenas|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_decenas|Mux2~0_combout\ = (\contador_decenas|cuenta\(2) & (((\contador_decenas|cuenta\(3))))) # (!\contador_decenas|cuenta\(2) & (\contador_decenas|cuenta\(1) & ((\contador_decenas|cuenta\(3)) # (!\contador_decenas|cuenta\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_decenas|cuenta\(2),
	datab => \contador_decenas|cuenta\(1),
	datac => \contador_decenas|cuenta\(3),
	datad => \contador_decenas|cuenta\(0),
	combout => \decoder_decenas|Mux2~0_combout\);

-- Location: LCCOMB_X4_Y8_N30
\decoder_decenas|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_decenas|Mux1~0_combout\ = (\contador_decenas|cuenta\(2) & ((\contador_decenas|cuenta\(3)) # (\contador_decenas|cuenta\(1) $ (\contador_decenas|cuenta\(0))))) # (!\contador_decenas|cuenta\(2) & (\contador_decenas|cuenta\(1) & 
-- (\contador_decenas|cuenta\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_decenas|cuenta\(2),
	datab => \contador_decenas|cuenta\(1),
	datac => \contador_decenas|cuenta\(3),
	datad => \contador_decenas|cuenta\(0),
	combout => \decoder_decenas|Mux1~0_combout\);

-- Location: LCCOMB_X4_Y8_N20
\decoder_decenas|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_decenas|Mux0~0_combout\ = (\contador_decenas|cuenta\(1) & (((\contador_decenas|cuenta\(3))))) # (!\contador_decenas|cuenta\(1) & (\contador_decenas|cuenta\(2) $ (((!\contador_decenas|cuenta\(3) & \contador_decenas|cuenta\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_decenas|cuenta\(2),
	datab => \contador_decenas|cuenta\(1),
	datac => \contador_decenas|cuenta\(3),
	datad => \contador_decenas|cuenta\(0),
	combout => \decoder_decenas|Mux0~0_combout\);

-- Location: LCCOMB_X5_Y8_N0
\decoder_unidades|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_unidades|Mux6~0_combout\ = (\contador_unidades|cuenta\(1) & (!\contador_unidades|cuenta\(3) & ((!\contador_unidades|cuenta\(2)) # (!\contador_unidades|cuenta\(0))))) # (!\contador_unidades|cuenta\(1) & (\contador_unidades|cuenta\(3) $ 
-- (((\contador_unidades|cuenta\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_unidades|cuenta\(3),
	datab => \contador_unidades|cuenta\(0),
	datac => \contador_unidades|cuenta\(1),
	datad => \contador_unidades|cuenta\(2),
	combout => \decoder_unidades|Mux6~0_combout\);

-- Location: LCCOMB_X5_Y8_N10
\decoder_unidades|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_unidades|Mux5~0_combout\ = (\contador_unidades|cuenta\(0) & ((\contador_unidades|cuenta\(1)) # (\contador_unidades|cuenta\(3) $ (!\contador_unidades|cuenta\(2))))) # (!\contador_unidades|cuenta\(0) & ((\contador_unidades|cuenta\(2) & 
-- (\contador_unidades|cuenta\(3))) # (!\contador_unidades|cuenta\(2) & ((\contador_unidades|cuenta\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_unidades|cuenta\(3),
	datab => \contador_unidades|cuenta\(0),
	datac => \contador_unidades|cuenta\(1),
	datad => \contador_unidades|cuenta\(2),
	combout => \decoder_unidades|Mux5~0_combout\);

-- Location: LCCOMB_X5_Y8_N24
\decoder_unidades|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_unidades|Mux4~0_combout\ = (\contador_unidades|cuenta\(0)) # ((\contador_unidades|cuenta\(1) & (\contador_unidades|cuenta\(3))) # (!\contador_unidades|cuenta\(1) & ((\contador_unidades|cuenta\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_unidades|cuenta\(3),
	datab => \contador_unidades|cuenta\(0),
	datac => \contador_unidades|cuenta\(1),
	datad => \contador_unidades|cuenta\(2),
	combout => \decoder_unidades|Mux4~0_combout\);

-- Location: LCCOMB_X5_Y8_N26
\decoder_unidades|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_unidades|Mux3~0_combout\ = (\contador_unidades|cuenta\(1) & ((\contador_unidades|cuenta\(3)) # ((\contador_unidades|cuenta\(0) & \contador_unidades|cuenta\(2))))) # (!\contador_unidades|cuenta\(1) & (\contador_unidades|cuenta\(2) $ 
-- (((!\contador_unidades|cuenta\(3) & \contador_unidades|cuenta\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101110100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_unidades|cuenta\(3),
	datab => \contador_unidades|cuenta\(0),
	datac => \contador_unidades|cuenta\(1),
	datad => \contador_unidades|cuenta\(2),
	combout => \decoder_unidades|Mux3~0_combout\);

-- Location: LCCOMB_X5_Y8_N28
\decoder_unidades|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_unidades|Mux2~0_combout\ = (\contador_unidades|cuenta\(2) & (\contador_unidades|cuenta\(3))) # (!\contador_unidades|cuenta\(2) & (\contador_unidades|cuenta\(1) & ((\contador_unidades|cuenta\(3)) # (!\contador_unidades|cuenta\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_unidades|cuenta\(3),
	datab => \contador_unidades|cuenta\(0),
	datac => \contador_unidades|cuenta\(1),
	datad => \contador_unidades|cuenta\(2),
	combout => \decoder_unidades|Mux2~0_combout\);

-- Location: LCCOMB_X5_Y8_N22
\decoder_unidades|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_unidades|Mux1~0_combout\ = (\contador_unidades|cuenta\(3) & (((\contador_unidades|cuenta\(1)) # (\contador_unidades|cuenta\(2))))) # (!\contador_unidades|cuenta\(3) & (\contador_unidades|cuenta\(2) & (\contador_unidades|cuenta\(0) $ 
-- (\contador_unidades|cuenta\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_unidades|cuenta\(3),
	datab => \contador_unidades|cuenta\(0),
	datac => \contador_unidades|cuenta\(1),
	datad => \contador_unidades|cuenta\(2),
	combout => \decoder_unidades|Mux1~0_combout\);

-- Location: LCCOMB_X5_Y8_N16
\decoder_unidades|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder_unidades|Mux0~0_combout\ = (\contador_unidades|cuenta\(1) & (\contador_unidades|cuenta\(3))) # (!\contador_unidades|cuenta\(1) & (\contador_unidades|cuenta\(2) $ (((!\contador_unidades|cuenta\(3) & \contador_unidades|cuenta\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_unidades|cuenta\(3),
	datab => \contador_unidades|cuenta\(0),
	datac => \contador_unidades|cuenta\(1),
	datad => \contador_unidades|cuenta\(2),
	combout => \decoder_unidades|Mux0~0_combout\);

ww_ssd_min(0) <= \ssd_min[0]~output_o\;

ww_ssd_min(1) <= \ssd_min[1]~output_o\;

ww_ssd_min(2) <= \ssd_min[2]~output_o\;

ww_ssd_min(3) <= \ssd_min[3]~output_o\;

ww_ssd_min(4) <= \ssd_min[4]~output_o\;

ww_ssd_min(5) <= \ssd_min[5]~output_o\;

ww_ssd_min(6) <= \ssd_min[6]~output_o\;

ww_ssd_dec(0) <= \ssd_dec[0]~output_o\;

ww_ssd_dec(1) <= \ssd_dec[1]~output_o\;

ww_ssd_dec(2) <= \ssd_dec[2]~output_o\;

ww_ssd_dec(3) <= \ssd_dec[3]~output_o\;

ww_ssd_dec(4) <= \ssd_dec[4]~output_o\;

ww_ssd_dec(5) <= \ssd_dec[5]~output_o\;

ww_ssd_dec(6) <= \ssd_dec[6]~output_o\;

ww_ssd_uni(0) <= \ssd_uni[0]~output_o\;

ww_ssd_uni(1) <= \ssd_uni[1]~output_o\;

ww_ssd_uni(2) <= \ssd_uni[2]~output_o\;

ww_ssd_uni(3) <= \ssd_uni[3]~output_o\;

ww_ssd_uni(4) <= \ssd_uni[4]~output_o\;

ww_ssd_uni(5) <= \ssd_uni[5]~output_o\;

ww_ssd_uni(6) <= \ssd_uni[6]~output_o\;
END structure;


