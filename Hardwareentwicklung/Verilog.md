---
tags:
aliases:
keywords:
subject:
  - KV
  - Entwurf Integrierter Schaltungen
semester: WS25
created: 23rd September 2025
professor:
draft: false
title: Verilog
---

# Verilog 

## Cheatsheet

### Kommentare

```verilog
// One-liner
/* Multiple 
   lines */
```
### Numerische Konstanten

```verilog
// The 8-bit decimal number 106
8'b_0110_1010 // Binary
8'o_152       // Octal
8'd_106       // Decimal
8'h_6A        // Hexadecimal
"j"           // ASCII
78'bZ         // 78-bit high-impedance
```

Zu kurze Konstanten werden mit 0 gepadded, zu lange werden von links abgeschnitten.

### Netze und Variablen

```verilog
wire [3:0]w; // Assign outside always blocks
reg [1:7]r; // Assign inside always blocks
reg [7:0]mem[31:0];

integer j; // Compiletime variable
genvar k; // Generate variable
```

### Parameters 

```verilog
parameter N = 8;
localparam State = 2'd3;
```

### Assignments

```verilog
assign Output = A * B;
assign {C, D} = {D[5:2], C[1:9], E};
```

### Operators

```verilog
// These are in order of precedence
// Select
A[N] A[N:M]
// Reduction
&A ~&A |A ~|A ^A ~^A
// Complement
!A ~A
// Unary
+A -A
// Concatenate
{A, ... , B}
// Replicate
{N{A}}
// Arithmetic
A*B A/B A%B A+B A-B
// Shift
A<<B A>>B
// Relational
A<B A>B A>=B A<=B A==B A!=B 
// Bit-wise
A&B A^B A~^B A|B
// Logical
A&&B A||B
// Conditional
A ? B : C
```

### Module

```verilog
module MyModule
#(parameter N = 8) // Optional Parameter
 (input Rst_i, Clk_i, 
  output [N-1:0]Result_o);
  // Module implementation
endmodule
```

### Module instantiation

```verilog
// Override default parameter: setting N = 13
MyModule #(13) MyModule1(rst, clk, result);
```

### Case

```verilog
always @(*) begin
	case(Mux)
		2'd0:       A = 8'd9;
		2'd1, 2'd3: A = 8'd103;
		2'd2:       A = 8'd2;
		default:;
	endcase
end

always @(*) begin
	casex(Decoded)
		4'b1xxx: Encoded = 2'd0;	
		4'b01xx: Encoded = 2'd1;	
		4'b001x: Encoded = 2'd2;	
		4'b0001: Encoded = 2'd3;	
		default: Encoded = 2'd0;
	endcase
end
```


### Synchronous

```verilog
always @(posedge Clk) begin
	if(Rst) B <= 0;
	else    B <= B + 1'b1;
end
```

### Loop

```verilog
always @(*) begin
	Count = 0;
	for(j = 0; j < 8; j = j+1)
		Count = Count + Input[j];
end	
```

### Function

```verilog
function [6:0]F;
	input [3:0]A;
	input [2:0]B;
	begin
		F = {A+1'b1, B+2'd2};
	end
endfunction
```

### Generate

```verilog
genvar j;
wire [12:0]Output[19:0];

generate
	for(j = 0; j < 20; j = j+1)
	begin: Gen_Modules
		MyModule #(13) MyModule_Instance(
			Reset, Clk,
			Output[j]
		);
	end
endgenerate
```

### State Machine

```verilog
reg [1:0]State;
localparam Start = 2'b00;
localparam Idle  = 2'b01;
localparam Work  = 2'b11;
localparam Done  = 2'b10;

reg tReset;

always @(posedge Clk) begin
	tReset <= Reset;
	
	if(tReset) begin
		State <= Start;
	end else begin
		case(State)
			Start: begin
				State <= Idle;
			end
			Idle: begin
				State <= Work;
			end
			Work: begin
				State <= Done;
			end
			Done: begin
				State <= Idle;
			end
			default:;
		endcase
	end
end
```