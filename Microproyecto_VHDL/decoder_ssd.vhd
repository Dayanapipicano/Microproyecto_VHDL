library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_ssd is

-- Define la entrada que recibe el número y la salida
-- que controla el display de 7 segmentos.

    port(
	 
	 -- Número de 4 bits que se quiere mostrar en el display
        digit : in  std_logic_vector(3 downto 0);
		  -- Señales que controlan los 7 segmentos del display
        ssd   : out std_logic_vector(6 downto 0)
    );

end decoder_ssd;


architecture flujo_datos of decoder_ssd is

begin


-- Según el valor de digit, se selecciona la combinación 
-- correspondiente para mostrar el número en el display.
    with digit select

        ssd <=
               "1000000" when "0000", -- 0
               "1111001" when "0001", -- 1
               "0100100" when "0010", -- 2
               "0110000" when "0011", -- 3
               "0011001" when "0100", -- 4
               "0010010" when "0101", -- 5
               "0000010" when "0110", -- 6
               "1111000" when "0111", -- 7
               "0000000" when "1000", -- 8
               "0010000" when "1001", -- 9
					-- Para cualquier valor diferente de 0 a 9,
					-- se apagan todos los segmentos.
               "1111111" when others;

end flujo_datos;