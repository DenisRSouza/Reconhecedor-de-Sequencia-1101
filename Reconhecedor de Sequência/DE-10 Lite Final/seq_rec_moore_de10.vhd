library ieee;
use ieee.std_logic_1164.all;

entity seq_rec_moore_de10 is
    port(
        SW    : in std_logic_vector(9 downto 0);  -- entradas
        KEY   : in std_logic_vector(1 downto 0);  -- key 0 e key 1
        LEDR  : out std_logic_vector(9 downto 0); 
        HEX0  : out std_logic_vector(6 downto 0); -- o display vai mostrar o estado atual tinha um ; no final
		  HEX5  : out std_logic_vector(6 downto 0)
    );
end seq_rec_moore_de10;

architecture rtl of seq_rec_moore_de10 is
    type state_type is (A, B, C, D, E);
    signal state, next_state : state_type;
    signal CLK, RESET, X : std_logic;
	
begin

    CLK <= not KEY(0); 
    RESET <= not KEY(1);
    X <= SW(0);

    process(CLK, RESET)
    begin
        if RESET = '1' then
            state <= A;
        elsif rising_edge(CLK) then
            state <= next_state;
        end if;
    end process;

   
    process(state, X)
    begin
        case state is
            when A =>
                if X = '1' then
                    next_state <= B;
                else
                    next_state <= A;
                end if;
            when B =>
                if X = '1' then
                    next_state <= C;
                else
                    next_state <= A;
                end if;
            when C =>
                if X = '1' then
                    next_state <= C;
                else
                    next_state <= D;
                end if;
            when D =>
                if X = '1' then
                    next_state <= E;
                else
                    next_state <= A;
                end if;
            when E =>
                if X = '1' then
                    next_state <= C;
                else
                    next_state <= A;
                end if;
        end case;
    end process;

    process(state)
    begin
        case state is
            when E => HEX5 <= "1111001";  -- 1
            when others => HEX5 <= "1000000"; --0
        end case;
    end process;

    -- desativa os leds que não vamos usar
    LEDR(9 downto 1) <= (others => '0');

    -- vai mostrar o estado atual no display
    process(state)
    begin
        case state is
            when A => HEX0 <= "0001000"; -- A
            when B => HEX0 <= "0000011"; -- b
            when C => HEX0 <= "1000110"; -- C
            when D => HEX0 <= "0100001"; -- d
            when E => HEX0 <= "0000110"; -- E
        end case;
    end process;

end;