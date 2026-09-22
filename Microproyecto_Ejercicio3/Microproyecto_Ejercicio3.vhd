library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.timer_pkg.all;

entity Microproyecto_Ejercicio3 is

    port(
	 
        clk    : in  std_logic;
		  --Boton que permite realizar todas las funciones 
		  --Start,Reset,Stop
        button : in  std_logic;
		 
        --Codigo reutilizado del ejercicio 2
        ssd_min : out std_logic_vector(6 downto 0);
        ssd_dec : out std_logic_vector(6 downto 0);
        ssd_uni : out std_logic_vector(6 downto 0)
		  --fin
    );

end Microproyecto_Ejercicio3;


architecture estructural of Microproyecto_Ejercicio3 is


    -- Variable de estado que indica si el temporizador está funcionando. 
	 -- Se utiliza para alternar entre START y STOP con una pulsación corta.
	 -- Apoyo de IA para organizar la lógica de funcionamiento del botón.
    signal running : std_logic := '0';
	 
	 -- Señal de reloj de 1 Hz utilizada para hacer avanzar el temporizador
    -- un segundo a la vez.
    signal clk_1hz : std_logic := '0';
	 
	 
	 -- Contador utilizado para dividir el reloj de la FPGA y obtener 1 Hz.
    signal cuenta_clk : unsigned(24 downto 0) := (others => '0');
    -- Guarda el estado anterior del botón para detectar el momento 
	 -- en que el usuario deja de presionarlo. 
	 -- Apoyo de IA para implementar la detección de pulsaciones.
    
	 signal button_anterior : std_logic := '1';
	 -- Contador utilizado para medir cuánto tiempo permanece presionado 
	 -- el botón y así diferenciar una pulsación corta de una larga. 
	 -- Apoyo de IA para implementar el reinicio después de 2 segundos.
     -- Contador para medir los 2 segundos
    signal tiempo_pulsado : unsigned(26 downto 0) := (others => '0');
    -- Señal utilizada para reiniciar los contadores del temporizador. 
	 -- Apoyo de IA para adaptar la función de RESET al único botón disponible.
    signal reset : std_logic := '0';
    
	 
	 --Codigo reutilizado del ejercicio 2
    signal min : std_logic_vector(3 downto 0);
    signal dec : std_logic_vector(3 downto 0);
    signal uni : std_logic_vector(3 downto 0);

    signal enable_uni : std_logic;
    signal enable_dec : std_logic;
    signal enable_min : std_logic;
	 --fin_reutilizado

begin
  -- Divisor de frecuencia: 50 MHz → 1 Hz
  --Codigo reutilizado del ejercicio 2
    process(clk)
    begin
        if rising_edge(clk) then

            if cuenta_clk = 24999999 then
                cuenta_clk <= (others => '0');
                clk_1hz <= not clk_1hz;
            else
                cuenta_clk <= cuenta_clk + 1;
            end if;

        end if;
    end process;
	 --fin_reutilizado



-- Control del botón
-- Esta parte permite utilizar un solo botón para realizar las funciones
-- de START, STOP y RESET.
-- Apoyo de IA para implementar la lógica de pulsación corta y larga.
    process(clk)
    begin
        if rising_edge(clk) then

          
            if button = '0' then
				
				-- El botón está presionado

                if tiempo_pulsado < 100000000  then
                    tiempo_pulsado <= tiempo_pulsado + 1;
                end if;
					 
					 -- Cuando se alcanzan aproximadamente 2 segundos
					 -- de pulsación, el temporizador se detiene y se reinicia.

                if tiempo_pulsado = 99999999  then
                    running <= '0';
                    reset <= '1';
                end if;

            else
				
				-- El botón acaba de soltarse

                if button_anterior = '0' then
					 
					  -- Si fue una pulsación corta, se alterna entre 
                 -- alternar START / STOP

                    if tiempo_pulsado < 99999999  then

                        if running = '0' then
                            running <= '1';
                        else
                            running <= '0';
                        end if;

                    end if;

                end if;

                tiempo_pulsado <= (others => '0');
					 -- Se desactiva el RESET después de soltar el botón.
					   if reset = '1' then
                    reset <= '0';
                end if;

            end if;
				
				-- Guarda el estado actual del botón para compararlo 
				-- con el siguiente ciclo.

            button_anterior <= button;

        end if;
    end process;

 -- Habilitación de los contadores
 --Codigo reutilizado del ejercicio 2
    enable_uni <= running;

    enable_dec <= running when uni = "1001" else '0';

    enable_min <= running
                  when (uni = "1001" and dec = "0101")
                  else '0';


						
	-- Contador de unidades
    contador_unidades : contador_10
        port map(
            clk    => clk_1hz,
            reset  => reset,
            enable => enable_uni,
            q      => uni
        );

-- Contador de decenas
    contador_decenas : contador_6
        port map(
            clk    => clk_1hz,
            reset  => reset,
            enable => enable_dec,
            q      => dec
        );

-- Contador de minutos
    contador_minutos : contador_10
        port map(
            clk    => clk_1hz,
            reset  => reset,
            enable => enable_min,
            q      => min
        );


    decoder_minutos : decoder_ssd
        port map(
            digit => min,
            ssd   => ssd_min
        );


    decoder_decenas : decoder_ssd
        port map(
            digit => dec,
            ssd   => ssd_dec
        );


    decoder_unidades : decoder_ssd
        port map(
            digit => uni,
            ssd   => ssd_uni
        );
		--fin_reutilizado

end estructural;