	.file	"or1200-fibonacci.c"
# GNU C (OpenRISC 32-bit toolchain for or32-elf (built 20150107)) version 4.5.1-or32-1.0rc4 (or32-elf)
#	compiled by GNU C version 4.6.4, GMP version 5.0.2, MPFR version 3.1.0-p3, MPC version 0.9
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -I../../../drivers/cfi-ctrl/include
# -I../../../drivers/ethmac/include
# -I../../../drivers/i2c_master_slave/include
# -I../../../drivers/or1200/include -I../../../drivers/simple-spi/include
# -I../../../drivers/uart/include -I../../../board/include
# -I../../../lib/include or1200-fibonacci.c -mhard-mul -mhard-div
# -msoft-float -mnewlib -auxbase-strip or1200-fibonacci.S -g -fverbose-asm
# options enabled:  -falign-loops -fargument-alias -fauto-inc-dec
# -fbranch-count-reg -fcommon -fdelete-null-pointer-checks -fearly-inlining
# -feliminate-unused-debug-types -ffunction-cse -fgcse-lm -fident
# -finline-functions-called-once -fira-share-save-slots
# -fira-share-spill-slots -fivopts -fkeep-static-consts
# -fleading-underscore -fmath-errno -fmerge-debug-strings
# -fmove-loop-invariants -fpcc-struct-return -fpeephole
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fshow-column -fsigned-zeros
# -fsplit-ivs-in-unroller -ftrapping-math -ftree-cselim -ftree-forwprop
# -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
# -ftree-parallelize-loops= -ftree-phiprop -ftree-pta -ftree-reassoc
# -ftree-scev-cprop -ftree-slp-vectorize -ftree-vect-loop-version
# -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss -mnewlib

	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section .text
.Ltext0:
# Compiler executable checksum: cf82c2de3ed83849a1fc14c3a3598784

	.align	4
.proc	main
	.global main
	.type	main, @function
main:
.LFB0:
.LM1:
	l.sw    	-4(r1),r2	 # SI store	#,
.LCFI0:
	l.addi  	r2,r1,0	#,,
.LCFI1:
	l.addi	r1,r1,-20	# allocate frame	#
.LCFI2:
.LM2:
	l.addi  	r3,r0,0	 # move immediate I	#,
	l.sw    	-12(r2),r3	 # SI store	# first,
.LM3:
	l.addi  	r3,r0,1	 # move immediate I	# tmp47,
	l.sw    	-16(r2),r3	 # SI store	# second, tmp47
.LM4:
	l.addi  	r3,r0,0	 # move immediate I	#,
	l.sw    	-8(r2),r3	 # SI store	# i,
	l.j     	.L2
	l.nop			# nop delay slot	#
.L3:
.LM5:
	l.lwz   	r4,-12(r2)	 # SI load	# first.0, first
	l.lwz   	r3,-16(r2)	 # SI load	# second.1, second
	l.add   	r3,r4,r3	# third.2, first.0, second.1
	l.sw    	-20(r2),r3	 # SI store	# third, third.2
.LM6:
	l.lwz   	r3,-16(r2)	 # SI load	# second.3, second
	l.sw    	-12(r2),r3	 # SI store	# first, second.3
.LM7:
	l.lwz   	r3,-20(r2)	 # SI load	# third.4, third
	l.sw    	-16(r2),r3	 # SI store	# second, third.4
.LM8:
	l.lwz   	r3,-20(r2)	 # SI load	# third.5, third
#APP
# 13 "or1200-fibonacci.c" 1
	l.addi	r3,r3,0	# third.5
# 0 "" 2
.LM9:
# 14 "or1200-fibonacci.c" 1
	l.nop 2	#
# 0 "" 2
.LM10:
#NO_APP
	l.lwz   	r3,-8(r2)	 # SI load	# tmp48, i
	l.addi  	r3,r3,1	# tmp49, tmp48,
	l.sw    	-8(r2),r3	 # SI store	# i, tmp49
.L2:
.LM11:
	l.lwz   	r3,-8(r2)	 # SI load	# tmp50, i
	l.sflesi	r3,19	# tmp50,
	l.bf	.L3
	l.nop			# nop delay slot	#
.LM12:
	l.movhi 	r3,hi(-2147483648)	 # move immediate M	# tmp52,
	l.ori   	r3,r3,13	# tmp51, tmp52,
#APP
# 16 "or1200-fibonacci.c" 1
	l.addi	r3,r3,0	# tmp51
# 0 "" 2
.LM13:
# 17 "or1200-fibonacci.c" 1
	l.nop 2	#
# 0 "" 2
.LM14:
#NO_APP
	l.addi  	r3,r0,0	 # move immediate I	# tmp53,
#APP
# 19 "or1200-fibonacci.c" 1
	l.add r3,r0,r3	# tmp53
# 0 "" 2
.LM15:
# 20 "or1200-fibonacci.c" 1
	l.nop 1	#
# 0 "" 2
#NO_APP
.L4:
.LM16:
	l.j     	.L4
	l.nop			# nop delay slot	#
.LFE0:
	.size	main, .-main
	.section	.debug_frame,"",@progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.string	""
	.uleb128 0x1
	.sleb128 -4
	.byte	0x9
	.byte	0xc
	.uleb128 0x1
	.uleb128 0x0
	.align	4
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0x82
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xd
	.uleb128 0x2
	.align	4
.LEFDE0:
	.section .text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LFB0-.Ltext0
	.4byte	.LCFI1-.Ltext0
	.2byte	0x2
	.byte	0x71
	.sleb128 0
	.4byte	.LCFI1-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x2
	.byte	0x72
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x81
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF3
	.byte	0x1
	.4byte	.LASF4
	.4byte	.LASF5
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.4byte	.LASF6
	.byte	0x1
	.byte	0x3
	.4byte	0x78
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LLST0
	.4byte	0x78
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x1
	.byte	0x4
	.4byte	0x7f
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x4
	.4byte	0x7f
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0x4
	.4byte	0x7f
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x4
	.string	"i"
	.byte	0x1
	.byte	0x5
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x6
	.4byte	0x78
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.4byte	0x17
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x85
	.4byte	0x25
	.string	"main"
	.4byte	0x0
	.section	.debug_pubtypes,"",@progbits
	.4byte	0xe
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x85
	.4byte	0x0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_line
	.4byte	.LELT0-.LSLT0
.LSLT0:
	.2byte	0x2
	.4byte	.LELTP0-.LASLTP0
.LASLTP0:
	.byte	0x1
	.byte	0x1
	.byte	0xf6
	.byte	0xf5
	.byte	0xa
	.byte	0x0
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x1
	.byte	0x0
	.string	"or1200-fibonacci.c"
	.uleb128 0x0
	.uleb128 0x0
	.uleb128 0x0
	.byte	0x0
.LELTP0:
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM1
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM2
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM3
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM4
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM5
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM6
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM7
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM8
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM9
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM10
	.byte	0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM11
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM12
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM13
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM14
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM15
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM16
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.Letext0
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,"MS",@progbits,1
.LASF1:
	.string	"second"
.LASF0:
	.string	"first"
.LASF2:
	.string	"third"
.LASF6:
	.string	"main"
.LASF5:
	.string	"/home/bony/Workspace/PhD/CipherCloud_FPGA/altera/de2i-150/orpsoc2/ref-sim/sw/tests/or1200/sim"
.LASF3:
	.string	"GNU C 4.5.1-or32-1.0rc4"
.LASF4:
	.string	"or1200-fibonacci.c"
	.ident	"GCC: (OpenRISC 32-bit toolchain for or32-elf (built 20150107)) 4.5.1-or32-1.0rc4"
