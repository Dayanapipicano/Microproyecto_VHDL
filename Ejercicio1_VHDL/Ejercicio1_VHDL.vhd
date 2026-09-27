library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.timer_pkg.all;
entity Ejercicio1_VHDL is

 port(
        clk     : in std_logic;
        entrada : in std_logic;
        salida  : in std_logic;

        alarma  : out std_logic;
		  felicitacion : out std_logic;

        ssd_dec : out std_logic_vector(6 downto 0);
        ssd_uni : out std_logic_vector(6 downto 0)
    );

end Ejercicio1_VHDL;




architecture estructural of Ejercicio1_VHDL is



    
    -- Reloj de 1 Hz para contar los segundos
    signal clk_1hz : std_logic := '0';

    -- Contador utilizado para dividir la frecuencia de 50 MHz
    signal cuenta_clk : unsigned(24 downto 0) := (others => '0');

    -- Valores mostrados en los displays
    signal dec : std_logic_vector(3 downto 0);
    signal uni : std_logic_vector(3 downto 0);
	 
	 
	     -- Habilitación de los contadores
    signal enable_uni : std_logic;
    signal enable_dec : std_logic;
	 
    -- Indica si el temporizador de 35 segundos está contando
    signal contando : std_logic := '0';


    -- Guarda el estado anterior de la entrada
    signal entrada_anterior : std_logic := '1';


    
	 -- Reinicia los contadores cuando entra una nueva persona
    signal reset_contadores : std_logic := '0';


	 
	 -- Indica que ya se superaron los 35 segundos
    signal tiempo_extra : std_logic := '0';
    -- Habilitación de los contadores del tiempo extra
    signal enable_extra_uni : std_logic;
    signal enable_extra_dec : std_logic;


    -- Valores del tiempo extra
    signal extra_dec : std_logic_vector(3 downto 0);
    signal extra_uni : std_logic_vector(3 downto 0);
	 
	 signal display_dec : std_logic_vector(3 downto 0);
    signal display_uni : std_logic_vector(3 downto 0);



begin


    ----------------------------------------------------------------
    -- DIVISOR DE FRECUENCIA
    -- Convierte los 50 MHz de la FPGA en aproximadamente 1 Hz
    ----------------------------------------------------------------

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

------------------------------------------------------------
    -- DETECCIÓN DE LA ENTRADA
    ------------------------------------------------------------
------------------------------------------------------------
-- CONTROL DE LA ENTRADA Y DEL TIEMPO EXTRA
------------------------------------------------------------

process(clk) 
begin 
 
    if rising_edge(clk) then 
 
 

        -- Detecta una nueva entrada.
        -- La entrada es activa en bajo.
        if entrada = '0' and entrada_anterior = '1' then 
		  
		  -- Reiniciar todos los contadores
            reset_contadores <= '1';
 
 
          

             -- Comienza nuevamente el temporizador
             contando <= '1';

             -- Ya no estamos en tiempo extra
             tiempo_extra <= '0';

             -- Apaga la felicitación anterior
             felicitacion <= '0';
			else

            -- Liberar el reset
            reset_contadores <= '0';
				 
		
 
        end if; 
		  -- Guardar estado anterior de entrada
        entrada_anterior <= entrada;
 
 
        -- Si se presiona SALIDA antes de los 35 segundos,
        -- se detiene el temporizador y se enciende
        -- el LED de felicitación.
        if salida = '0' and contando = '1' then

            contando <= '0';
            felicitacion <= '1';

        

        end if;
		  
		  if salida = '0' and tiempo_extra = '1' then

           tiempo_extra <= '0';

        end if;


        -- Cuando el contador llega a 35 segundos, 
        -- se detiene el primer temporizador 
        -- y comienza el tiempo extra.
        if contando = '1' and dec = "0011" and uni = "0101" then

            contando <= '0';
            tiempo_extra <= '1';

        end if;
 
 
     
 
    end if; 
 
end process;

   
	 
	 
  ------------------------------------------------------------
    -- ALARMA
    ------------------------------------------------------------

    -- La alarma se enciende cuando comienza el tiempo extra.
    alarma <= tiempo_extra;
	
	 
	 
    ------------------------------------------------------------
    -- HABILITACIÓN DE LOS CONTADORES
    ------------------------------------------------------------

    -- Las unidades cuentan mientras el temporizador esté activo
    -- y todavía no haya llegado a 35 segundos.
    enable_uni <= contando
                  when not (dec = "0011" and uni = "0101")
                  else '0';


    -- Las decenas avanzan cuando las unidades llegan a 9.
    -- También se bloquean cuando el tiempo llega a 35.
    enable_dec <= contando
                  when (uni = "1001" and
                        not (dec = "0011" and uni = "0101"))
                  else '0';
						
						
						  ------------------------------------------------------------
    -- HABILITACIÓN DEL TIEMPO EXTRA
    ------------------------------------------------------------

    -- Las unidades del tiempo extra cuentan mientras
    -- la persona continúa ocupando el espacio.
    enable_extra_uni <= tiempo_extra;


    -- Las decenas avanzan cuando las unidades llegan a 9.
    enable_extra_dec <= tiempo_extra
                        when extra_uni = "1001"
                        else '0';
								
								
	display_dec <= extra_dec when tiempo_extra = '1' else dec;

   display_uni <= extra_uni when tiempo_extra = '1' else uni;

    ----------------------------------------------------------------
    -- CONTADOR DE UNIDADES
    -- Cuenta de 0 a 9
    ----------------------------------------------------------------

    contador_unidades : contador_10

        port map(
            clk    => clk_1hz,
            reset => reset_contadores,
            enable => enable_uni,
            q      => uni
        );


    ----------------------------------------------------------------
    -- CONTADOR DE DECENAS
    -- Cuenta de 0 a 9
    ----------------------------------------------------------------

    contador_decenas : contador_10

        port map(
            clk    => clk_1hz,
            reset => reset_contadores,
            enable => enable_dec,
            q      => dec
        );

		  
		      ------------------------------------------------------------
    -- CONTADOR DE UNIDADES DEL TIEMPO EXTRA
    ------------------------------------------------------------

    contador_extra_unidades : contador_10

        port map(
            clk    => clk_1hz,
            reset => reset_contadores,
            enable => enable_extra_uni,
            q      => extra_uni
        );


    ------------------------------------------------------------
    -- CONTADOR DE DECENAS DEL TIEMPO EXTRA
    ------------------------------------------------------------

    contador_extra_decenas : contador_10

        port map(
            clk    => clk_1hz,
            reset => reset_contadores,
            enable => enable_extra_dec,
            q      => extra_dec
        );



    ----------------------------------------------------------------
    -- DECODIFICADOR DE DECENAS
    ----------------------------------------------------------------

    decoder_decenas : decoder_ssd

        port map(
            digit => display_dec,
            ssd   => ssd_dec
        );


    ----------------------------------------------------------------
    -- DECODIFICADOR DE UNIDADES
    ----------------------------------------------------------------

    decoder_unidades : decoder_ssd

        port map(
            digit => display_uni,
            ssd   => ssd_uni
        );


end estructural;