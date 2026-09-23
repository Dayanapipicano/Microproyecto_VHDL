library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.timer_pkg.all;
entity Ejercicio1_VHDL is

port(
      clk : in std_logic;
      entrada : in std_logic;
		led : out std_logic;

      ssd_dec : out std_logic_vector(6 downto 0);
      ssd_uni : out std_logic_vector(6 downto 0)
);

end Ejercicio1_VHDL;


architecture estructural of Ejercicio1_VHDL is

          -- Reloj de 1 Hz
          signal clk_1hz : std_logic := '0';

          -- Contador utilizado para dividir la frecuencia
          signal cuenta_clk : unsigned(24 downto 0) := (others => '0');

        

          -- Contador de tiempo
          signal tiempo : unsigned(5 downto 0) := (others => '0');
			 
			 signal iniciado : std_logic := '0';
			 signal button_anterior : std_logic := '1';

          -- Dígitos que se mostrarán en los displays
          signal dec : std_logic_vector(3 downto 0);
          signal uni : std_logic_vector(3 downto 0);
			 
			 signal alarma : std_logic := '0';

begin

-- Divisor de frecuencia: 50 MHz → 1 Hz
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

process(clk_1hz)
   begin
        if rising_edge(clk_1hz) then

           if entrada = '1' then

               if tiempo < 35 then
                 tiempo <= tiempo + 1;
               else
                 alarma <= '1';
               end if;

           end if;

         end if;
end process;

led <= alarma;

-- Detección de la pulsación del botón

    process(clk_1hz)

    begin

        if rising_edge(clk_1hz) then

            if entrada = '0' and button_anterior = '1' then

                iniciado <= '1';

            end if;

            button_anterior <= entrada;

        end if;

    end process;

-- Temporizador de 35 s

 

-- Separación del tiempo en decenas y unidades

    dec <= std_logic_vector(to_unsigned(to_integer(tiempo) / 10, 4));
    uni <= std_logic_vector(to_unsigned(to_integer(tiempo) mod 10, 4));

    -- Display de las decenas

    decoder_decenas : decoder_ssd

        port map(

            digit => dec,

            ssd   => ssd_dec

        );

    -- Display de las unidades

    decoder_unidades : decoder_ssd

        port map(

            digit => uni,

            ssd   => ssd_uni

        );

end estructural;