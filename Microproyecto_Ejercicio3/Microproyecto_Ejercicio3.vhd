library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Microproyecto_Ejercicio3 is
    port(
        clk     : in  std_logic;
        button  : in  std_logic;

        ssd_min : out std_logic_vector(6 downto 0);
        ssd_dec : out std_logic_vector(6 downto 0);
        ssd_uni : out std_logic_vector(6 downto 0)
    );
end Microproyecto_Ejercicio3;


architecture estructural of Microproyecto_Ejercicio3 is

    -- Estados y control del botón
    signal running      : std_logic := '0';
    signal button_prev  : std_logic := '0';
    signal tiempo_boton : unsigned(1 downto 0) := (others => '0');
    signal long_press   : std_logic := '0';
    signal reset_timer  : std_logic := '0';

    -- Salidas de los contadores
    signal min : std_logic_vector(3 downto 0);
    signal dec : std_logic_vector(3 downto 0);
    signal uni : std_logic_vector(3 downto 0);

    -- Habilitación de los contadores
    signal enable_uni : std_logic;
    signal enable_dec : std_logic;
    signal enable_min : std_logic;

begin

    ----------------------------------------------------------------
    -- CONTROL DEL BOTÓN
    --
    -- Una pulsación corta:
    --     1ª → START
    --     2ª → STOP
    --     3ª → START
    --     ...
    --
    -- Mantenerlo pulsado más de 2 segundos:
    --     RESET
    ----------------------------------------------------------------

    process(clk)
    begin
        if rising_edge(clk) then

            -- Por defecto, reset_timer está desactivado
            reset_timer <= '0';

            -- Detectamos una nueva pulsación
            if button = '1' and button_prev = '0' then

                -- Alternar START / STOP
                running <= not running;

                -- Comenzamos a medir cuánto lleva pulsado
                tiempo_boton <= "01";

                -- Todavía no es pulsación larga
                long_press <= '0';

            -- El botón sigue presionado
            elsif button = '1' and button_prev = '1' then

                -- Contamos los segundos que lleva presionado
                if tiempo_boton < "11" then
                    tiempo_boton <= tiempo_boton + 1;
                end if;

                -- Al tercer segundo ya superó los 2 segundos
                if tiempo_boton = "10" then
                    running <= '0';
                    reset_timer <= '1';
                    long_press <= '1';
                end if;

            -- El botón acaba de ser soltado
            elsif button = '0' and button_prev = '1' then

                -- Si NO fue pulsación larga, no hacemos nada más.
                -- El START/STOP ya ocurrió al presionar.

                tiempo_boton <= (others => '0');

            end if;

            -- Guardamos el estado actual para el siguiente ciclo
            button_prev <= button;

        end if;
    end process;


    ----------------------------------------------------------------
    -- HABILITACIONES DE LOS CONTADORES
    ----------------------------------------------------------------

    enable_uni <= running;

    enable_dec <= running
                  when uni = "1001"
                  else '0';

    enable_min <= running
                  when (uni = "1001" and dec = "0101")
                  else '0';


    ----------------------------------------------------------------
    -- CONTADOR DE UNIDADES
    -- REUTILIZADO DEL EJERCICIO 2
    ----------------------------------------------------------------

    contador_unidades : entity work.contador_10
        port map(
            clk    => clk,
            reset  => reset_timer,
            enable => enable_uni,
            q      => uni
        );


    ----------------------------------------------------------------
    -- CONTADOR DE DECENAS
    -- REUTILIZADO DEL EJERCICIO 2
    ----------------------------------------------------------------

    contador_decenas : entity work.contador_6
        port map(
            clk    => clk,
            reset  => reset_timer,
            enable => enable_dec,
            q      => dec
        );


    ----------------------------------------------------------------
    -- CONTADOR DE MINUTOS
    -- REUTILIZADO DEL EJERCICIO 2
    ----------------------------------------------------------------

    contador_minutos : entity work.contador_10
        port map(
            clk    => clk,
            reset  => reset_timer,
            enable => enable_min,
            q      => min
        );


    ----------------------------------------------------------------
    -- DECODIFICADORES
    -- REUTILIZADOS DEL EJERCICIO 2
    ----------------------------------------------------------------

    decoder_minutos : entity work.decoder_ssd
        port map(
            digit => min,
            ssd   => ssd_min
        );

    decoder_decenas : entity work.decoder_ssd
        port map(
            digit => dec,
            ssd   => ssd_dec
        );

    decoder_unidades : entity work.decoder_ssd
        port map(
            digit => uni,
            ssd   => ssd_uni
        );

end estructural;