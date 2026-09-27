library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package timer_pkg is

    -- Contador de 0 a 9
    component contador_10
        port(
            clk    : in  std_logic;
            reset  : in  std_logic;
            enable : in  std_logic;
            q      : out std_logic_vector(3 downto 0)
        );
    end component;


    -- Contador de 0 a 5
    component contador_6
        port(
            clk    : in  std_logic;
            reset  : in  std_logic;
            enable : in  std_logic;
            q      : out std_logic_vector(3 downto 0)
        );
    end component;


    -- Decodificador de 7 segmentos
    component decoder_ssd
        port(
            digit : in  std_logic_vector(3 downto 0);
            ssd   : out std_logic_vector(6 downto 0)
        );
    end component;

end package timer_pkg;