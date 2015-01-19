`include "timescale.v"
`timescale 1ns/1ns

module aes_enc_wb(
		  wb_clk_i, wb_rst_i, wb_dat_i, wb_dat_o, 

		  // WISHBONE slave
		  wb_adr_i, wb_sel_i, wb_we_i, wb_cyc_i, wb_stb_i, wb_ack_o,

		  // encryption reg
		  plaintext_o, ciphertext_i, enc_cs, enc_done
		  );
   
   // WISHBONE common
   input           wb_clk_i;     // WISHBONE clock
   input           wb_rst_i;     // WISHBONE reset
   input [31:0]    wb_dat_i;     // WISHBONE data input
   output reg [31:0] wb_dat_o;     // WISHBONE data output
   // WISHBONE error output

   // WISHBONE slave
   input [7:0] 	     wb_adr_i;     // WISHBONE address input
   input [3:0] 	     wb_sel_i;     // WISHBONE byte select input
   input 	     wb_we_i;      // WISHBONE write enable input
   input 	     wb_cyc_i;     // WISHBONE cycle input
   input 	     wb_stb_i;     // WISHBONE strobe input
   output 	     wb_ack_o;     // WISHBONE acknowledge output

   // control signal
   output reg 	     enc_cs;
   input 	     enc_done;
   
   // data in/out
   input [127:0]     ciphertext_i;
   output reg [127:0] plaintext_o;



   // internal wire/reg
   reg [127:0] 	      plaintext_reg;
   reg [127:0] 	      ciphertext_reg;

   reg 		      done_reg; 		      
   reg 		      start;

   reg 		      cs;
		      

   //Register Addreses 
`define plainIn0 8'h00
`define plainIn1 8'h04
`define plainIn2 8'h08
`define plainIn3 8'h0c
`define cipherOut0 8'h10
`define cipherOut1 8'h14
`define cipherOut2 8'h18
`define cipherOut3 8'h1c
`define encdone 8'h20

   assign wb_ack_o = wb_cyc_i & wb_stb_i;
   
   always @(posedge wb_clk_i or posedge wb_rst_i)
     begin
	if (wb_rst_i) begin
	   cs <= 0;
	end
	else begin
	   cs <= 0;	   
	   if ((wb_stb_i  & wb_cyc_i) || wb_ack_o )begin 
	      if (wb_we_i) begin
		 case (wb_adr_i) 
		   // MSB first, LSB last
	           `plainIn0:  plaintext_reg[127:96]  <=  wb_dat_i;
	           `plainIn1:  plaintext_reg[95:64]  <=  wb_dat_i;
	           `plainIn2:  plaintext_reg[63:32]  <=  wb_dat_i;
	           `plainIn3:  begin
		      plaintext_reg[31:0]  <=  wb_dat_i;		   
		      cs <= 1;
		   end
	           // `cipherOut0:  ciphertext_reg[127:96]  <=  wb_dat_i;
	           // `cipherOut1:  ciphertext_reg[95:64]  <=  wb_dat_i;
	           // `cipherOut2:  ciphertext_reg[63:32]  <=  wb_dat_i;
	           // `cipherOut3:  ciphertext_reg[31:0]  <=  wb_dat_i;
		 endcase
	      end 	   
	   end // if ((wb_stb_i  & wb_cyc_i) || wb_ack_o )
	end
     end // always @ (posedge wb_clk_i or posedge wb_rst_i)

   always @(posedge wb_clk_i)
     enc_cs <= cs;

   always @(negedge cs)	
     plaintext_o <= plaintext_reg;

   always @(posedge wb_clk_i)
    #5  if (enc_done)
	      #5 ciphertext_reg[127:0] <= #5 ciphertext_i[127:0];
	   
   
   reg state;
   
   parameter IDLE = 1'b0;
   parameter WAIT_FOR_CS_HIGH = 1'b1;
   
   initial state = IDLE;
   
   always @(posedge wb_clk_i)
   begin
      case (state)
        IDLE: 
          if (enc_done) begin
            done_reg <= 1;
            state <= WAIT_FOR_CS_HIGH;
        end
        else begin
          done_reg <= 0;
          state <= IDLE;
        end
        WAIT_FOR_CS_HIGH:
          if (cs) begin
            done_reg<= 0;
            state <= IDLE;
        end
      else begin
        done_reg <= 1;
        state <= WAIT_FOR_CS_HIGH;
      end
    endcase
  end
   
   // always @(posedge wb_clk_i)
   //   begin
   // 	if (enc_done)
   // 	  done_reg <= 1;
   //   end

   always @(posedge wb_clk_i )begin
      if (wb_stb_i  & wb_cyc_i) begin //CS
	 case (wb_adr_i)
	   `plainIn0:  wb_dat_o  <=   plaintext_reg[127:96];
	   `plainIn1:  wb_dat_o  <=   plaintext_reg[95:64];
	   `plainIn2:  wb_dat_o  <=   plaintext_reg[63:32];
	   `plainIn3:  wb_dat_o  <=   plaintext_reg[31:0];
	   `cipherOut0:  wb_dat_o  <=  ciphertext_reg[127:96];
	   `cipherOut1:  wb_dat_o  <=  ciphertext_reg[95:64];
	   `cipherOut2:  wb_dat_o  <=  ciphertext_reg[63:32];
	   `cipherOut3:  wb_dat_o  <=  ciphertext_reg[31:0];	   
	   `encdone:  wb_dat_o  <=  {31'b0, done_reg};
	 endcase
      end 
   end // always @ (posedge wb_clk_i )
   
endmodule
