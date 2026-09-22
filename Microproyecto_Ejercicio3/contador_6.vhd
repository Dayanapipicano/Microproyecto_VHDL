library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


--Codigo reutilizado del ejercicio 2
entity contador_6 is
    port(
        clk    : in  std_logic;
        reset  : in  std_logic;
        enable : in  std_logic;
        q      : out std_logic_vector(3 downto 0)
    );
end contador_6;




architecture comportamental of contador_6 is

    signal contador : unsigned(3 downto 0) := (others => '0');

begin

    process(clk, reset)
    begin
        if reset = '1' then
            contador <= (others => '0');

        elsif rising_edge(clk) then

            if enable = '1' then

                if contador = 5 then
                    contador <= (others => '0');
                else
                    contador <= contador + 1;
                end if;

            end if;

        end if;
    end process;

    q <= std_logic_vector(contador);

end comportamental;