-- VHDL Exercises Chapter 1 section 4 VHDL Modeling concepts

/* [1.4 - 1] Briefly outline the purposes of the following VHDL modeling constructs:
 * 1. entity declaration
 * 2. behavioral architecture body,
 * 3. structural architecture body,
 * 4. process statement,
 * 5. signal assignment statement
 * 6. port map.
 */

-- 1. An entity declaration introduces a name for an entity and lists input and output ports

entity reg4 is 
	port (
		d0, d1, d2, d3, en, clk : in bit; 	-- input port, datatype is "bit"
		q0, q1, q2, q3 : out bit 			-- output port, datatype is "bit"
	);
end entity reg4;

-- 2. A behavioral architecture body describes a function in an anstract way.
-- - only consists of process statements -> 4. collections of actions executed in sequence (sequential statement)

architecture behav of reg4 is
begin
	storage : process is
		variable st_d0, st_d1, st_d2, st_d3 : bit;  -- 5. declare storing variables
	begin
		wait until clk; -- waits until clk bit is "1"
		if en then 		-- only accept input if en bit is "1"
			st_d0 := d0;-- assigns the value of d0 to st_d0
			st_d1 := d1;
			st_d2 := d2;
			st_d3 := d3;
		end if;
		q0 <= st_d0 after 5ns; -- load variable st_d0 into q0 output signal
		q1 <= st_d1 after 5ns;
		q2 <= st_d2 after 5ns;
		q3 <= st_d3 after 5ns;
	end process storage;
end architecture behav;

-- 3. A structural architecture body composes a function from subsystems e.g. register from D-FlipFlop and other Gates
-- First define the subsystems as entities and their architectures

-- Subsystem D-FF
entity d_ff is
	port (d, clk : in bit; q : out bit);
end entity d_ff;

architecture basic of d_ff is
begin
	ff_behav : process is -- seq statement
	begin
		wait until clk;
		q <= d after 2ns;
	end process ff_behav;
end architecture basic;

-- Subsystem AND Gate

entity and2 is
	port (a, b : in bit; y : out bit);
end entity and2;

architecture basic of and2 is
begin
	and2_behav : process is -- sequential statement
	begin
		y <= a and b after 2ns;
		wait on a, b;
	end process and2_behav;
end architecture basic;

-- construct structural architecture

architecture struct of reg4 is
	signal int_clk : bit; -- define signal (connection) int_clk (is clk and en)
begin
	bit0 : entity work.d_ff(basic) -- represents 0 bit D-FF
		port map (d0, int_clk, q0); -- 6. port map IOs/variables into the behavioural architecture
	bit1 : entity work.d_ff(basic) 
		port map (d1, int_clk, q1);
	bit2 : entity work.d_ff(basic) 
		port map (d2, int_clk, q2);
	bit3 : entity work.d_ff(basic) 
		port map (d3, int_clk, q3);
	gate : entity work.and2(basic) 
		port map (clk, en, int_clk);
end architecture struct;

/* [1.4 - 2] Write an entity declaration and a behavioral architecture body for a two-input
 * multiplexer, with input ports a, b and sel and an output port z. If the sel input is ‘0’,
 * the value of a should be copied to z, otherwise the value of b should be copied to z.
 * Write a test bench for the multiplexer model, and test it using a VHDL simulator.
 */
 
entity mux is
	port (
		a, b, sel :in bit;
		z : out bit;
	);
end entity mux;

architecture behav of mux is
begin
	mux_behav : process is
	begin
		if sel then
			z <= b;
		else 
			z <= a;
		end if;
		-- z <= (a and (not sel)) or (b and sel); 
		wait on a, b, sel;
	end process mux_behav;
end architecture behav;

/* [1.4 - 3] Write an entity declaration and a structural architecture body for a 4-bit-wide
 * multiplexer, using instances of the 2-bit multiplexer from Exercise 10. The input ports
 * are a0, a1, a2, a3, b0, b1, b2, b3 and sel, and the output ports are z0, z1, z2 and z3.
 * When sel is ‘0’, the inputs a0 to a3 are copied to the outputs, otherwise the inputs b0
 * to b3 are copied to the outputs. Write a test bench for the multiplexer model, and test
 * it using a VHDL simulator.
 */ 
 
entity mux4 is
	port (
		a0, a1, a2, a3, b0, b1, b2, b3, sel : in bit;
		z0, z1, z2, z3 : out bit
	); 
end entity mux4
 
architecture struct of mux4 is 
begin
	ch0 : entity work.mux(behav)
		port map (a0, b0, sel, z0);
	ch1 : entity work.mux(behav)
		port map (a1, b1, sel, z1);
	ch2 : entity work.mux(behav)
		port map (a2, b2, sel, z2);
	ch3 : entity work.mux(behav)
		port map (a3, b3, sel, z3);
end architecture struct;
