library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador_10 is

    port(
	 
	 -- Reloj que controla el contador
        clk    : in  std_logic;
        reset  : in  std_logic;
		  -- Permite que el contador avance cuando está en 1
        enable : in  std_logic;
		  -- Valor actual del contador
        q      : out std_logic_vector(3 downto 0)
    );

end contador_10;


architecture comportamental of contador_10 is

    -- Valor interno del contador
    signal cuenta : unsigned(3 downto 0) := (others => '0');

begin

    -- Proceso secuencial
    process(clk, reset)
    begin

        -- Si se activa el reset, el contador vuelve a cero.
        if reset = '0' then
            cuenta <= (others => '0');

        -- Conteo en flanco de subida
        elsif rising_edge(clk) then

            -- Solo contar cuando está habilitado
            if enable = '1' then

                -- Límite del contador: 9
                if cuenta = 9 then
                    cuenta <= (others => '0');

                else
                    cuenta <= cuenta + 1;

                end if;

            end if;

        end if;

    end process;


  -- Envía el valor del contador a la salida.
    q <= std_logic_vector(cuenta);

end comportamental;