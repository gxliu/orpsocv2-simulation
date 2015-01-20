//------------------------------
// Module name: or1200_enc_fsm_top
// Function: the top module that wraps the fsm and encryption
// engines for load and store path
// unit to/from the cache memory
// Creator:  Bony Chen
// Version:  1.0
// Date:     18 Jan 2015
//------------------------------

`include "or1200_defines.v"

module or1200_enc_fsm_top(
			  clk, rst,
			  // input of encryption seed, seedRead
			  seedIn, seedAddr, seedImm, seed_read,
			  // output of the encrypted data
			  dataIn_load, dataOut_load, 
			  dataIn_store, dataOut_store,
			  // control signal
			  unstall_load, unstall_store
			  );
   
   input clk;
   input rst;

   // Seed Input and control
   input [31:0]	 seedIn;
   input [4:0]	 seedAddr;
   input [10:0]	 seedImm;
   input 	 seed_read;
   

   // Data I/O
   input [31:0] dataIn_load;
   input [31:0] dataIn_store;
   output [31:0] dataOut_load;
   output [31:0] dataOut_store;

   // encryption data and control I/O
   output 	 unstall_load;
   output 	 unstall_store;

   // common registeres and wires for LOAD and STORE
   wire [127:0]  encryption_key;
   
   // internal registers and wires for LOAD
   wire [31:0] 	 seedIn_load;
   wire [4:0] 	 seedAddr_load;
   wire [10:0] 	 seedImm_load;
   
   // internal registers and wires for STORE
   wire [31:0] 	 seedIn_store;
   wire [4:0] 	 seedAddr_store;
   wire [10:0] 	 seedImm_store;
   
   
   assign encryption_key = 128'h0123456789abcdef0123456789abcdef;

   // Instantiation of LOAD fsm and encryption engines
   or1200_encryption_fsm
     or1200_enc_load_fsm(
			 .clk(clk),
			 .rst(rst),
			 .dataIn(dataIn_load),
			 .dataOut(dataOut_load),
			 .seedIn(seedIn_load),
			 .seedAddr(seedAddr_load),
			 .seedImm(seedImm_load),
			 .enc_key(encryption_key),
			 .unstall(unstall_load)
			 );

   or1200_encryption_fsm
     or1200_enc_store_fsm(
			  .clk(clk),
			  .rst(rst),
			  .dataIn(dataIn_store),
			  .dataOut(dataOut_store),
			  .seedIn(seedIn_store),
			  .seedAddr(seedAddr_store),
			  .seedImm(seedImm_store),
			  .enc_key(encryption_key),
			  .unstall(unstall_store)
			  );

   assign seedImm_load = (seedImm[10] & seed_read) ? seedImm : 11'b0;
   assign seedIn_load = (seedImm[10] & seed_read) ? seedIn : 5'b0;
   assign seedAddr_load = (seedImm[10] & seed_read) ? seedAddr : 5'b0;

   assign seedImm_store = (!seedImm[10] & seed_read) ? seedImm : 11'b0;
   assign seedIn_store = (!seedImm[10] & seed_read) ? seedIn : 5'b0;
   assign seedAddr_store = (!seedImm[10] & seed_read) ? seedAddr : 5'b0;

   //
   // Store the seedImm, seedIn and seedAddr into a buffer when 
   // seed_read is asserted
   //
   
endmodule