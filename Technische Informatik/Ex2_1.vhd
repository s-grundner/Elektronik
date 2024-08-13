-- VHDL Exercise from Chapter 2 Section 1 - Constants and Variables

/* [2.1 - 1] Write constant declarations for
 * the number of bits in a 32-bit word
 * and for the number π (3.14159).
 */

constant number_of_bits_i32 : integer := 32;
constant pi : real := 3.141592;

/* [2.1 - 2] Write variable declarations for
 * a counter, initialized to 0;
 * a status flag used to indicate whether a module is busy;
 * and a standard-logic value used to store a temporary result.
 */
 
variable counter : integer := 0;
variable is_busy: boolean := false;
variable status_flag : std_ulogic = 'U';

/* [2.1 - 3] Given the declarations in Exercise 2, write variable assignment statements to
 * increment the counter,
 * to set the status flag to indicate the module is busy
 * and to indicate a weak unknown temporary result.
 */ 
 
counter := counter + 1;
is_busy := true;
status_flag := 'W';
