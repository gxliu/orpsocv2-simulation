radix define opcode {
6'h38 "l.add/and/div/divu/mul/or/ror/sll/sra/srl/sub/xor",
6'h25 "l.addi",
6'h28 "l.andi",
6'h02 "l.bal",
6'h04 "l.bf",
6'h03 "l.bnf",
6'h05 "l.brk/jalr/jr/nop/rfe/sys",
6'h00 "l.j",
6'h01 "l.jal",
6'h22 "l.lbs",
6'h21 "l.lbz",
6'h24 "l.lhs",
6'h23 "l.lhz",
6'h20 "l.lw",
6'h07 "l.mfsr",
6'h06 "l.movhi",
6'h10 "l.mtsr",
6'h2b "l.muli",
6'h29 "l.ori",
6'h2d "l.rori",
6'h36 "l.sb",
6'h39 "l.sfeq/sfges/sfgeu/sfgts/sfgtu/sfles/sfleu/sflts/sfltu/sfne",
6'h2e "l.sfeqi/sfgesi/sfgeui/sfgtsi/sfgtui/sflesi/sfleui/sfltsi/sfltui/sfnei",
6'h37 "l.sh",
6'h2d "l.slli/srai/srli",
6'h27 "l.subi",
6'h2a "l.xori",
6'h35 "l.sw",
-default hex
}

add wave -position end -label or1200_clk_i sim:/orpsoc_testbench/dut/or1200_top0/clk_i 
add wave -position end -label or1200_rst_i sim:/orpsoc_testbench/dut/or1200_top0/rst_i 
add wave -position end -radix hex -label wbm_i_or12_adr_o sim:/orpsoc_testbench/dut/wbm_i_or12_adr_o 
add wave -position end -label wbm_i_or12_stb_o sim:/orpsoc_testbench/dut/wbm_i_or12_stb_o 
add wave -position end -label wbm_i_or12_cyc_o sim:/orpsoc_testbench/dut/wbm_i_or12_cyc_o 
add wave -position end -label wbm_i_or12_ack_i sim:/orpsoc_testbench/dut/wbm_i_or12_ack_i 
add wave -position end -label wbm_i_or12_dat_i -radix hex sim:/orpsoc_testbench/dut/wbm_i_or12_dat_i 

add wave -position end -radix hex -label wbm_d_or12_adr_o sim:/orpsoc_testbench/dut/wbm_d_or12_adr_o 
add wave -position end -label wbm_d_or12_stb_o sim:/orpsoc_testbench/dut/wbm_d_or12_stb_o 
add wave -position end -label wbm_d_or12_cyc_o sim:/orpsoc_testbench/dut/wbm_d_or12_cyc_o 
add wave -position end -label wbm_d_or12_ack_i sim:/orpsoc_testbench/dut/wbm_d_or12_ack_i 
add wave -position end -label wbm_d_or12_we_o sim:/orpsoc_testbench/dut/wbm_d_or12_we_o 
add wave -position end -radix hex -label wbm_d_or12_dat_i sim:/orpsoc_testbench/dut/wbm_d_or12_dat_i 
add wave -position end -radix hex -label wbm_d_or12_dat_o sim:/orpsoc_testbench/dut/wbm_d_or12_dat_o 

add wave -position end -radix hex -label wbs_d_mc0_adr_i sim:/orpsoc_testbench/dut/wbs_d_mc0_adr_i 
add wave -position end -label wbs_d_mc0_stb_i sim:/orpsoc_testbench/dut/wbs_d_mc0_stb_i 
add wave -position end -label wbs_d_mc0_cyc_i sim:/orpsoc_testbench/dut/wbs_d_mc0_cyc_i 
add wave -position end -label wbs_d_mc0_ack_o sim:/orpsoc_testbench/dut/wbs_d_mc0_ack_o 
add wave -position end -radix hex -label wbs_d_mc0_we_i sim:/orpsoc_testbench/dut/wbs_d_mc0_we_i 
add wave -position end -radix hex -label wbs_d_mc0_dat_i sim:/orpsoc_testbench/dut/wbs_d_mc0_dat_i 

add wave -position end -radix opcode -label opcode sim:/orpsoc_testbench/monitor/or1200_print_op/opcode 
add wave -position end -radix hex -label rD_num sim:/orpsoc_testbench/monitor/or1200_print_op/rD_num 
add wave -position end -radix hex -label rA_num sim:/orpsoc_testbench/monitor/or1200_print_op/rA_num 
add wave -position end -radix hex -label rB_num sim:/orpsoc_testbench/monitor/or1200_print_op/rB_num 

add wave -position end -label insns_count sim:/orpsoc_testbench/monitor/insns 
add wave -position end -radix ASCII -label TEST_NAME sim:/orpsoc_testbench/monitor/TEST_NAME_STRING 