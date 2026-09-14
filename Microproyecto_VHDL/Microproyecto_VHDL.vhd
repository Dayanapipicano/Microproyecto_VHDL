library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.timer_pkg.all;


entity Microproyecto_VHDL is

    port(
        clk   : in  std_logic;
        start : in  std_logic;
        stop  : in  std_logic;
        reset : in  std_logic;

        ssd_min : out std_logic_vector(6 downto 0);
        ssd_dec : out std_logic_vector(6 downto 0);
        ssd_uni : out std_logic_vector(6 downto 0)
    );

end Microproyecto_VHDL;




architecture estructural of Microproyecto_VHDL is
    
    -- Señal que indica si el temporizador está funcionando
    signal running : std_logic;
	 
	 -- Indica si el temporizador está funcionando
	 signal clk_1hz : std_logic := '0';
	 -- Contador utilizado para dividir la frecuencia
    signal cuenta_clk : unsigned(24 downto 0) := (others => '0');

    -- Valores de los tres dígitos del temporizador
    -- min = minutos
    -- dec = decenas de segundos
    -- uni = unidades de segundos
    signal min : std_logic_vector(3 downto 0);
    signal dec : std_logic_vector(3 downto 0);
    signal uni : std_logic_vector(3 downto 0);

    -- Habilitación de cada contador
    signal enable_uni : std_logic;
    signal enable_dec : std_logic;
    signal enable_min : std_logic;
	 
	   
begin

    -- Divisor de frecuencia: 50 MHz → 1 Hz
    process(clk, reset)
    begin
        if reset = '1' then
            cuenta_clk <= (others => '0');
            clk_1hz <= '0';

        elsif rising_edge(clk) then

            if cuenta_clk = 24999999 then
                cuenta_clk <= (others => '0');
                clk_1hz <= not clk_1hz;
            else
                cuenta_clk <= cuenta_clk + 1;
            end if;

        end if;
    end process;
	 



    -- Control de START y STOP
    process(clk, reset)
	 begin
	 
        if reset = '1' then
            running <= '0';

        elsif rising_edge(clk) then

            if start = '1' then
                running <= '1';

            elsif stop = '1' then
                running <= '0';

            end if;

        end if;
    end process;
	   -- Las unidades cuentan mientras el temporizador está funcionando
    enable_uni <= running;

    -- Las decenas avanzan cuando las unidades están en 9
    enable_dec <= running when uni = "1001" else '0';

    -- Los minutos avanzan cuando estamos en 59 segundos
    enable_min <= running when (uni = "1001" and dec = "0101") else '0';
    
	 
	   -- Instancia del contador de unidades (0-9)
    contador_unidades : contador_10
        port map(
            clk    => clk,
            reset  => reset,
            enable => enable_uni,
            q      => uni
        );

    -- Instancia del contador de decenas de segundos (0-5)
    contador_decenas : contador_6
        port map(
            clk    => clk,
            reset  => reset,
            enable => enable_dec,
            q      => dec
        );

    -- Instancia del contador de minutos (0-9)
    contador_minutos : contador_10
        port map(
            clk    => clk,
            reset  => reset,
            enable => enable_min,
            q      => min
        );
		  
	    -- Decodificador para el display de minutos
    decoder_minutos : decoder_ssd
        port map(
            digit => min,
            ssd   => ssd_min
        );

    -- Decodificador para el display de decenas de segundos
    decoder_decenas : decoder_ssd
        port map(
            digit => dec,
            ssd   => ssd_dec
        );

    -- Decodificador para el display de unidades de segundos
    decoder_unidades : decoder_ssd
        port map(
            digit => uni,
            ssd   => ssd_uni
        );

end estructural;