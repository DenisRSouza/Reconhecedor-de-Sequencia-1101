-- Sequence Recognizer: VHDL Process Description
-- (See Figure 4-21 for state diagram)
library ieee;
use ieee.std_logic_1164.all;
entity seq_rec_moore1 is
   port(CLK, RESET, X: in std_logic;
        Z: out std_logic;
		state_out: out std_logic_vector(2 downto 0) -- 2 dowto 0 porque agora precisamos de 3 bits por causa do estado E
		);
end seq_rec_moore1;

architecture process_3 of seq_rec_moore1 is
   type state_type is (A, B, C, D, E);
   signal state, next_state : state_type;
begin

-- Process 1 - state_register: implements positive edge-triggered
-- state storage with asynchronous reset. 
   state_register: process (CLK, RESET)
   begin
     if (RESET = '1') then
        state <= A;
     else
        if (CLK'event and ClK = '1') then
           state <= next_state;
        end if;
     end if;
end process;

-- Process 2 - next_state_function: implements next state as function
-- of input X and state. 
   next_state_func: process (X, state)
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
		  next_state <=C;
		else 
		  next_state <= A;
		  end if;
      end case;
   end process;

-- Process 3 - output_function: implements output as function
-- of input X and state. 
   output_func: process (X, state)
   begin
      case state is
      when A =>
		Z <= '0';
	  when B =>
		Z <= '0';
	  when C =>
		Z <= '0';
      when D =>
		Z <= '0';
	  when E =>
		Z <= '1';
      end case;
   end process;
   with state select
   state_out <= "000" when A,
                "001" when B,
                "011" when C,
                "010" when D,
                "110" when E;
end;