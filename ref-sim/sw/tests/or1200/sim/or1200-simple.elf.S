	.file	"or1200-simple.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section .text
.Ltext0:
	.align	4
.proc	main
	.global main
	.type	main, @function
main:
.LFB0:
.LM1:
	l.sw    	-8(r1),r2	 # SI store
.LCFI0:
	l.sw    	-4(r1),r9	 # SI store
.LCFI1:
.LM2:
	l.addi  	r2,r0,0	 # move immediate I
.LM3:
	l.addi  	r1,r1,-20
.LCFI2:
.LM4:
	l.sw    	8(r1),r2	 # SI store
.LVL0:
.LM5:
	l.addi  	r2,r0,1	 # move immediate I
	l.sw    	4(r1),r2	 # SI store
.LVL1:
	l.addi  	r2,r0,101	 # move immediate I
.LVL2:
.L2:
.LM6:
	l.lwz   	r3,8(r1)	 # SI load
	l.lwz   	r4,4(r1)	 # SI load
.LM7:
	l.addi  	r2,r2,-1
.LM8:
	l.add   	r3,r4,r3
.LVL3:
	l.sw    	0(r1),r3	 # SI store
.LVL4:
.LM9:
	l.lwz   	r3,4(r1)	 # SI load
.LVL5:
	l.sw    	8(r1),r3	 # SI store
.LM10:
	l.lwz   	r3,0(r1)	 # SI load
.LVL6:
	l.sw    	4(r1),r3	 # SI store
.LM11:
	l.lwz   	r3,0(r1)	 # SI load
.LVL7:
	l.jal   	report
	l.nop			# nop delay slot
.LM12:
	l.sfnei	r2,0
	l.bf	.L2	# delay slot filled
	l.movhi 	r3,hi(-2147483648)	 # move immediate M
.LM13:
	l.jal   	report	# delay slot filled
	l.ori   	r3,r3,13
.LM14:
	l.jal   	exit	# delay slot filled
	l.ori   	r3,r2,0	 # move reg to reg
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
	.4byte	.LCFI1-.LFB0
	.byte	0x89
	.uleb128 0x1
	.byte	0x82
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x14
	.align	4
.LEFDE0:
	.section .text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LFB0-.Ltext0
	.4byte	.LCFI2-.Ltext0
	.2byte	0x2
	.byte	0x71
	.sleb128 0
	.4byte	.LCFI2-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x2
	.byte	0x71
	.sleb128 20
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -12
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL6-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -12
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -16
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL7-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -16
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -20
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL5-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -20
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x8e
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
	.byte	0xb
	.4byte	0x85
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LLST0
	.4byte	0x85
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x1
	.byte	0xd
	.4byte	0x8c
	.4byte	.LLST1
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0xe
	.4byte	0x8c
	.4byte	.LLST2
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0xf
	.4byte	0x8c
	.4byte	.LLST3
	.uleb128 0x4
	.string	"n"
	.byte	0x1
	.byte	0xf
	.4byte	0x8c
	.uleb128 0x5
	.string	"i"
	.byte	0x1
	.byte	0x10
	.4byte	0x85
	.4byte	.LLST4
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x7
	.4byte	0x85
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
	.uleb128 0x6
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
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
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.4byte	0x92
	.4byte	0x25
	.string	"main"
	.4byte	0x0
	.section	.debug_pubtypes,"",@progbits
	.4byte	0xe
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x92
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
	.string	"or1200-simple.c"
	.uleb128 0x0
	.uleb128 0x0
	.uleb128 0x0
	.byte	0x0
.LELTP0:
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM1
	.byte	0x1f
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM2
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM3
	.byte	0x13
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
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM7
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM8
	.byte	0x11
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM9
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM10
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM11
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM12
	.byte	0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM13
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM14
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
.LASF4:
	.string	"or1200-simple.c"
.LASF6:
	.string	"main"
.LASF5:
	.string	"/home/bony/Workspace/PhD/CipherCloud_FPGA/altera/de2i-150/orpsoc2/ref-sim/sw/tests/or1200/sim"
.LASF3:
	.string	"GNU C 4.5.1-or32-1.0rc4"
	.ident	"GCC: (OpenRISC 32-bit toolchain for or32-elf (built 20150107)) 4.5.1-or32-1.0rc4"
