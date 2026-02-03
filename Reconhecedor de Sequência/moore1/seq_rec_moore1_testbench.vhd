library ieee;
use ieee.std_logic_1164.all;

entity seq_rec_moore1_testbench is
end seq_rec_moore1_testbench;

architecture behavior of seq_rec_moore1_testbench is

-- definição dos componentes do circuito
component seq_rec_moore1
port(
    clk: in std_logic;
    X: in std_logic;
    reset: in std_logic;
    Z: out std_logic;
    state_out: out std_logic_vector(2 downto 0)
);
end component;

-- entradas, clock, reset, e saídas
signal clk: std_logic := '0';
signal X: std_logic := '0';
signal reset: std_logic := '0';
signal Z: std_logic;
signal state_out: std_logic_vector(2 downto 0);
signal A, B, C_n: std_logic;

-- definição do tempo de clock
constant clk_period: time := 20 ns;

begin


uut: seq_rec_moore1 port map(
    clk => clk,
    X => X,
    reset => reset,
    Z => Z,
    state_out => state_out
);

-- Z = ABC´, pois Z=1 apenas quando está no estado E=110 
A <= state_out(2);         
B <= state_out(1);         
C_n <= not state_out(0);   

-- comportamento do clock
clk_process : process 
begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
end process;

-- teste com diferentes entradas
teste: process
begin
    reset <= '1';
    wait for 100 ns;

    reset <= '0';
    X <= '1'; wait for 20 ns;
    X <= '1'; wait for 20 ns;
    X <= '0'; wait for 20 ns;
    X <= '1'; wait for 20 ns;
    X <= '0'; wait for 20 ns;
    X <= '1'; wait for 20 ns;
    X <= '0'; wait for 20 ns;
    X <= '0'; wait;
end process;

end;
