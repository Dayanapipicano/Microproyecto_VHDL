library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.timer_pkg.all;


entity Microproyecto_VHDL is

    port(
	 
	     -- Reloj principal de la FPGA
        clk   : in  std_logic;
        start : in  std_logic;
        stop  : in  std_logic;
        reset : in  std_logic;
        punto : out std_logic;
		  
        
		  --Salidad de los displays de 7 segmentos
        ssd_min : out std_logic_vector(6 downto 0);
        ssd_dec : out std_logic_vector(6 downto 0);
        ssd_uni : out std_logic_vector(6 downto 0)
    );

end Microproyecto_VHDL;




architecture estructural of Microproyecto_VHDL is
    
    -- Señal que indica si el temporizador está funcionando
    signal running : std_logic;
	 
	 -- Señal de reloj de 1 Hz utilizada para que el temporizador 
	 -- avance una vez por segundo.
	 signal clk_1hz : std_logic := '0';
	 -- Contador utilizado para dividir la frecuencia del reloj 
	 -- de la FPGA y obtener una señal de 1 Hz.
    signal cuenta_clk : unsigned(24 downto 0) := (others => '0');

    -- Valores de los tres dígitos del temporizador
    -- min = minutos 2
    -- dec = decenas de segundos 4
    -- uni = unidades de segundos 7
	 -- 02:47
	 
    signal min : std_logic_vector(3 downto 0);
    signal dec : std_logic_vector(3 downto 0);
    signal uni : std_logic_vector(3 downto 0);

    -- Habilitación de cada contador
    signal enable_uni : std_logic;
    signal enable_dec : std_logic;
    signal enable_min : std_logic;
	 
	   
begin


    punto <= '0' when (running = '1' and min /= "0000") else '1';
    -- Divisor de frecuencia: 50 MHz → 1 Hz 

    process(clk, reset)
    begin
	 
	 -- Cuando reset está activo, el divisor vuelve a su estado inicial.
        if reset = '0' then
		  --Cuenta los pulsos
            cuenta_clk <= (others => '0');
            clk_1hz <= '0';

				
		-- El contador se actualiza en cada flanco de subida del reloj.
        elsif rising_edge(clk) then

		  
		  -- Al alcanzar 24.999.999 se reinicia el contador 
		  -- y se cambia el estado de clk_1hz.
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
	 
	     
		   -- Si se activa el reset, se detiene el contador
        if reset = '0' then
            running <= '0';

				
		 -- Se ejecuta en cada flanco de subida del reloj.
        elsif rising_edge(clk) then

		  
		  -- START activo en cero: pone el temporizador a funcionar.
            if start = '0' then
                running <= '1';
				

            elsif stop = '0' then
                running <= '0';

            end if;

        end if;
    end process;
	 
	   -- Las unidades cuentan mientras el temporizador está funcionando
    enable_uni <= running;

    -- Las decenas avanzan cuando las unidades están en 9
    enable_dec <= running when uni = "1001" else '0';

    -- Los minutos avanzan cuando estamos en 59 segundos
	 -- unidades en 9 y las decenas en 5.
    enable_min <= running when (uni = "1001" and dec = "0101") else '0';
    
	 
	 
	 --Instancias de contadores conectadas señales con el componente de diseño
	 
	   
    contador_unidades : contador_10
        port map(
            clk    => clk_1hz,
            reset  => reset,
            enable => enable_uni,
            q      => uni
        );
		  
		  -- El contador recibe el reloj de 1 Hz y entrega su resultado 
		  -- en la señal uni.

    --0-5
    contador_decenas : contador_6
        port map(
            clk    => clk_1hz,
            reset  => reset,
            enable => enable_dec,
            q      => dec
        );


    contador_minutos : contador_10
        port map(
            clk    => clk_1hz,
            reset  => reset,
            enable => enable_min,
            q      => min
        );
		  
	  -- Decodificadores para los displays
	
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

end estructural;