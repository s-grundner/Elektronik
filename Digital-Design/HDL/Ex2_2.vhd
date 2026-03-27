-- VHDL Exercise from Chapter 2 Section 2 - Scalar Types

/* [2.2 - 1] Write a package declaration containing type declarations for
 * small non-negative integers representable in eight bits;
 * fractional numbers between –1.0 and +1.0;
 * electrical currents, with units of nA, μA, mA and A;
 * and traffic light colors.
 */

type small_integer is range 0 to 255;
type fractional_number is range -1.0 to 1.0;
type electrical_current is range 0 to 1E9
units
	nA;
	µA = 1000 nA;
	mA = 1000 µA;
	A = 1000 mA;
end units electrical_current;

type traffic_light is (red, yellow, green);