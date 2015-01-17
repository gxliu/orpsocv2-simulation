//------------------------------
// Module name: or1200_encryption
// Function: encrypt/decrpyt the data flowing from/to the load-store 
// unit to/from the cache memory
// Creator:  Bony Chen
// Version:  1.0
// Date:     12 Jan 2015
//------------------------------

`include "or1200_defines.v"

module or1200_encryption_fsm(
			 clk, rst,
			 // data I/O    
			 dataIn1, dataOut1, dataIn2, dataOut2,
			 // seed Input
			 seedIn, seedAddr, seedImm, seedRead,
			 // encryption data and control I/O
			 enc_start, enc_done, enc_key, enc_seed, enc_pad,
			 // Control signals
			 wb_control, unstall);

   input clk;
   input rst;

   // Data I/O
   input [31:0] dataIn1;
   input [31:0] dataIn2;
   
   output [31:0] dataOut1;
   output [31:0] dataOut2;

   // Seed Input and control
   input [4:0]	 seedIn;
   input [4:0]	 seedAddr;
   input [10:0]	 seedImm;
   input 	 seedRead;

   // encryption data and control I/O
   output 	 enc_start;
   input 	 enc_done;
   output [127:0] enc_key;
   output [127:0] enc_seed;
   input [127:0] enc_pad; 	 
   
   // Control signals
   output wb_control;
   
   output unstall;

   //reg [31:0] dataOut1;
   //reg [31:0] dataOut2;

   // internal seed register
   reg [31:0] row;
   reg [15:0]  col;
   reg [15:0]  tb;
   reg [7:0]   db;
   reg [15:0]   usr;
  
   reg 	  wb_control;
   reg 	  stall;
   reg 	  fsm_unstall;
   

   parameter SETUP_SEED = 1'b0;
   parameter WAIT_ENC = 1'b1;

   reg 	       state;
   reg [127:0] enc_pad_buf;	       

   assign enc_seed = {40'b0, usr, db, tb, col, row};
   //assign dataOut1 = dataIn1 ^ enc_pad[31:0];
   assign dataOut2 = dataIn2 ^ enc_pad_buf[31:0];
   assign dataOut1 = dataIn1;
   //assign dataOut2 = dataIn2;
   assign unstall = enc_done | fsm_unstall;
   

   or1200_pulse_gen or1200_pulse_gen(
				     .clk(clk),
				     .rst(rst),
				     .in(seedImm[0]),
				     .insn(1'b0),
				     .pulse(enc_start)
				     );

   always @(posedge clk or `OR1200_RST_EVENT rst)
     if (rst == `OR1200_RST_VALUE) begin
	state <= SETUP_SEED;
	fsm_unstall <= 1;
     end
     else begin
	case (state)
	  
	  SETUP_SEED: begin
	     fsm_unstall <= 1;
	     if (seedImm[0]) 
	       state <= WAIT_ENC;
	     else state <= SETUP_SEED;
	  end

	  WAIT_ENC:
	    if (enc_done) begin
	       state <= SETUP_SEED;
	       fsm_unstall <= 1;
	       enc_pad_buf <= enc_pad;
	    end
	    else begin
	       state <= WAIT_ENC;
	       fsm_unstall <= 0;	       
	    end

	endcase
     end // else: !if(rst == `OR1200_RST_VALUE)
   
   always @(posedge clk or `OR1200_RST_EVENT rst)
     if (rst == `OR1200_RST_VALUE) begin
	row <= 32'b0;
	col <= 16'b0;
	tb <= 16'b0;
	db <= 8'b0;
	usr <= 16'b0;
	wb_control <= 0;	
     end
     else begin
	case (seedImm[5:1])
	  5'b00001: row <= {27'b0, seedIn};
	  5'b00010: col <= {11'b0, seedIn};
	  5'b00100: tb <= {11'b0, seedIn};
	  5'b01000: db <= {3'b0, seedIn};
	  5'b10000: usr <= {11'b0, seedIn};
	endcase
     end // else: !if(rst == `OR1200_RST_VALUE)
   	         
endmodule
   