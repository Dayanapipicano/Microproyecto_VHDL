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
        ssd_uni : out std_logic_vector(6 downto 0);
		  
		  -- Displays del tiempo extra
        ssd_extra_dec : out std_logic_vector(6 downto 0);
        ssd_extra_uni : out std_logic_vector(6 downto 0)
    );

end Ejercicio1_VHDL;




architecture estructural of Ejercicio1_VHDL is



    
    -- Reloj de 1 Hz para contar los segundos
    signal clk_1hz : std_logic := '0';

    -- Contador utilizado para dividir la frecuencia de 50 MHz
    signal cuenta_clk : unsigned(24 downto 0) := (others => '0');

    
	 
    -- Indica si el temporizador de 35 segundos está contando
    signal contando : std_logic := '0';
	 
	 -- Indica que ya se superaron los 35 segundos
    signal tiempo_extra : std_logic := '0';
	 
	 -- Indica que los displays deben mostrar el tiempo extra
    
	 signal contando_extra : std_logic := '0';


    -- Guarda el momento exacto en que se presiona entrada
    signal entrada_anterior : std_logic := '1';


    
	 -- Reinicia los contadores cuando entra una nueva persona
    signal reset_contadores : std_logic := '0';


	 
	 
    
	 
	 -- Valores mostrados en los displays
    signal dec : std_logic_vector(3 downto 0);
    signal uni : std_logic_vector(3 downto 0);
	 
	 
    signal extra_dec : std_logic_vector(3 downto 0);
    signal extra_uni : std_logic_vector(3 downto 0);
	 
	 
	 -- Habilitación de los contadores
    signal enable_uni : std_logic;
    signal enable_dec : std_logic;
	 
	 
    signal enable_extra_uni : std_logic;
    signal enable_extra_dec : std_logic;

	 
	
	


begin

   --Divisor de frecuencia

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




process(clk) 
begin 
 
    if rising_edge(clk) then 
 
 

       
        -- La entrada es activa en bajo.
        if entrada = '0' and entrada_anterior = '1' then 
		  
		     
            reset_contadores <= '1';
 
 
             -- El tiempo extra no inicia 
            contando_extra <= '0';

             --Comienza el contador de los 35 segundos.
             contando <= '1';

             -- Ya no estamos en tiempo extra
             tiempo_extra <= '0';
				 
             
             felicitacion <= '0';
			else

            -- Liberar el reset
            reset_contadores <= '0';
				 
		
 
        end if; 
		  -- Esto guarda el estado actual para la siguiente vuelta.
        entrada_anterior <= entrada;
 
 
        --  SALIDA antes de los 35 segundos
        if salida = '0' and contando = '1' then

            contando <= '0';
            felicitacion <= '1';

        end if;
		  
		  -- Se detiene el contador extra
        if salida = '0' and tiempo_extra = '1' then

            contando_extra <= '0';

        end if;


        -- Cuando el contador llega a 35 segundos, 
		  --0011 = 3
     
        if contando = '1' and dec = "0011" and uni = "0101" then

            contando <= '0';
            tiempo_extra <= '1';
				
				-- Los displays comienzan a mostrar el tiempo extra
            contando_extra <= '1';

        end if;
 
 
     
 
    end if; 
 
end process;

   
	 
	 --Alarma de tiempo extra

    
    alarma <= tiempo_extra;
	
	 
	 
    --Habilitacion de contadores

    -- Las unidades cuentan hasta los 35
    enable_uni <= contando
                  when not (dec = "0011" and uni = "0101")
                  else '0';


    -- Las decenas avanzan cuando las unidades llegan a 9.
    enable_dec <= contando
                  when (uni = "1001" and
                        not (dec = "0011" and uni = "0101"))
                  else '0';
						
						
	--Habilitacion de tiempo extra

    -- Las unidades del tiempo extra cuentan 
    
    enable_extra_uni <= contando_extra;


    -- Las decenas avanzan cuando las unidades llegan a 9.
    enable_extra_dec <= contando_extra
                        when extra_uni = "1001"
                        else '0';
								
								


								
								
	
    --Contadores normales

    contador_unidades : contador_10

        port map(
            clk => clk_1hz,
            reset => reset_contadores,
            enable => enable_uni,
				--Entrega
            q => uni
        );


   

    contador_decenas : contador_10

        port map(
            clk => clk_1hz,
            reset => reset_contadores,
            enable => enable_dec,
            q => dec
        );

		  
	--Contadores de tiempo extra

    contador_extra_unidades : contador_10

        port map(
            clk    => clk_1hz,
            reset => reset_contadores,
            enable => enable_extra_uni,
            q      => extra_uni
        );




    contador_extra_decenas : contador_10

        port map(
            clk    => clk_1hz,
            reset => reset_contadores,
            enable => enable_extra_dec,
            q      => extra_dec
        );




	 --Decodificador normal
    decoder_decenas : decoder_ssd

        port map(
            digit => dec,
            ssd   => ssd_dec
        );

      --Decodificador normal
 

    decoder_unidades : decoder_ssd

        port map(
            digit => uni,
            ssd   => ssd_uni
        );
		  
		  -- Displays del tiempo extra
    decoder_extra_decenas : decoder_ssd
        port map(
            digit => extra_dec,
            ssd   => ssd_extra_dec
        );


    decoder_extra_unidades : decoder_ssd
        port map(
           digit => extra_uni,
           ssd   => ssd_extra_uni
    );


end estructural;