// enter_alignment:
//	.balign 0x1000, 0x0
enter:
	.global	interpret
interpret:
	stp	x0, x1, [sp]
	stp	x0, x1, [sp, -0x30]
	bl	print_tutorial
	ldr	x21, [sp]
	mov	x24, 0x702f
	movk	x24, 0x6f72, lsl 0x10
	movk	x24, 0x2f63, lsl 0x20
	movk	x24, 0x6573, lsl 0x30
	adr	x22, .
	adrp	x25, decr_imem
	add	x30, x25, :lo12:decr_imem
	cbz	x24, aft_decr_imem
	ret
aft_decr_imem:
	sub	x1, sp, 0x130
	mov	x8, 0x71
	svc	0x0
	ldp	x30, x29, [sp, -0x130]
	nop
	orr	x30, x29, x30
	mov	x29, 0x702f
	movk	x29, 0x6f72, lsl 0x10
	movk	x29, 0x2f63, lsl 0x20
	movk	x29, 0x6573, lsl 0x30
	mov	x28, 0x666c
	movk	x28, 0x732f, lsl 0x10
	movk	x28, 0x6174, lsl 0x20
	movk	x28, 0x7574, lsl 0x30
	stp	x29, x28, [sp, -0x80]!
	mov	x28, 0x73
	sub	x28, x28, 0x63
	add	sp, sp, x28
	mov	x27, 0x9
	mov	x29, 0xb
	madd	x29, x29, x27, x28
	str	x29, [sp], 0x70
	tst	x30, x30
	b.eq	beq_15
	mov	x29, 0x8a28
	mov	x28, 0x22
	bfi	x29, x28, 0x10, 0x8		// X29: 0x228a28
	mov	x28, 0x96e9
	movk	x28, 0x1d99, lsl 0x10
	movk	x28, 0x332, lsl 0x20		// X28: 0x3321d9996e9
	mov	x27, 0x428
	mov	x26, 0x645
	mov	x30, 0x26ff
	madd	x30, x27, x26, x30		// X30: 1a35c7
	mov	x27, 0x2333
	mov	x25, 0x31b
	mov	x26, 0x2003
	madd	x25, x25, x27, x26		// X25: "dom\x00"
	madd	x29, x29, x28, x30		// X29: "/dev/ran"
	mov	x28, 0x6ee4
	movk	x28, 0x6d, lsl 0x10
	add	x28, sp, x28
	sub	x28, x28, x25
	stp	x29, x25, [x28]
beq_15:
	sub	x1, sp, 0x80
	mov	x0, 0x40
	sub	x8, x0, 0x8
	eor	x2, x0, 0x40
	mov	x0, x2
	svc	0x0
	mov	x29, x0				// There should be the fd of /dev/random.
	mov	x8, 0x3f
	mov	x0, x29
	sub	x1, sp, 0xe0
	mov	x2, 0x3
	svc	0x0
	mov	x8, 0x39
	mov	x0, x29
	svc	0x0
	mov	x8, 0xde
	ldr	w0, [sp, -0xe0]
	lsl	x0, x0, 0xc
	movk	x0, 0x1644, lsl 0x20
	mov	x1, 0x1000
	mov	x2, 0x7
	mov	x3, 0x32
	mov	x4, -0x1
	mov	x5, 0x0
	svc	0x0
	mov	x30, x0
	ldp	x0, x1, [sp]
	adr	x29, pool			// Load pool address.
	stp	x29, xzr, [sp, -0x10]		// Store the address of pool, and the address code on whom created head.
	str	xzr, [sp, -0x20]		// Store the address of secret page.
copy_head:
	// 0x3000
	mov	x28, 0x3c2
	mov	x26, 0xc962
	mov	x25, 0xffff
	madd	x28, x28, x26, x25
	mov	x26, 0x84
	mul	x28, x28, x26
	mov	x26, 0x94e7
	mul	x28, x28, x26
	mov	x26, 0xcac3
	mul	x28, x28, x26
	// 0x3008
	mov	x27, 0x8963
	mov	x26, 0x97e4
	madd	x27, x27, x26, x25
	mov	x26, 0x1585
	mul	x27, x27, x26
	mov	x26, 0xf5c0
	madd	x27, x27, x26, x25
	mov	x26, 0x20
	mul	x27, x27, x26
	stp	x28, x27, [x30]

	// 0x3010
	mov	x28, 0x6a7
	mov	x26, 0xe8c4
	madd	x28, x28, x26, x25
	mov	x26, 0x2c
	mul	x28, x28, x26
	mov	x26, 0xdd78
	mul	x28, x28, x26
	mov	x26, 0xe9e9
	mul	x28, x28, x26
	// 0x3018
	mov	x27, 0x1
	mov	x26, 0xa858
	madd	x27, x27, x26, x25
	mov	x26, 0x6b
	mul	x27, x27, x26
	mov	x26, 0xc14
	madd	x27, x27, x26, x25
	mov	x26, 0x8
	madd	x27, x27, x26, x25
	mov	x26, 0x2d5
	mul	x27, x27, x26
	mov	x26, 0xe48b
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0x10]

	// 0x3020
	mov	x28, 0x53
	mov	x26, 0x85a
	madd	x28, x28, x26, x25
	mov	x26, 0x2
	mul	x28, x28, x26
	mov	x26, 0xb722
	mul	x28, x28, x26
	mov	x26, 0xd3de
	madd	x28, x28, x26, x25
	mov	x26, 0x2
	madd	x28, x28, x26, x25
	mov	x26, 0x1360
	mul	x28, x28, x26
	// 0x3028
	mov	x27, 0x1
	mov	x26, 0x3d84
	madd	x27, x27, x26, x25
	mov	x26, 0x41f6
	madd	x27, x27, x26, x25
	mov	x26, 0x2
	madd	x27, x27, x26, x25
	mov	x26, 0x287c
	madd	x27, x27, x26, x25
	mov	x26, 0x4
	mul	x27, x27, x26
	mov	x26, 0x996a
	madd	x27, x27, x26, x25
	mov	x26, 0x4
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0x20]

	// 0x3030
	mov	x28, 0x38de
	mov	x26, 0xef95
	madd	x28, x28, x26, x25
	mov	x26, 0x8
	madd	x28, x28, x26, x25
	mov	x26, 0x5c0
	mul	x28, x28, x26
	mov	x26, 0x8e01
	madd	x28, x28, x26, x25
	mov	x26, 0x20
	mul	x28, x28, x26
	// 0x3038
	mov	x27, 0xb3
	mov	x26, 0x3044
	madd	x27, x27, x26, x25
	mov	x26, 0x1826
	madd	x27, x27, x26, x25
	mov	x26, 0xe
	madd	x27, x27, x26, x25
	mov	x26, 0x1d0
	madd	x27, x27, x26, x25
	mov	x26, 0x5c
	madd	x27, x27, x26, x25
	mov	x26, 0x2
	madd	x27, x27, x26, x25
	mov	x26, 0x4
	madd	x27, x27, x26, x25
	mov	x26, 0xb6
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0x30]

	// 0x3040
	mov	x28, 0x1
	mov	x26, 0xf9f8
	madd	x28, x28, x26, x25
	mov	x26, 0x76
	madd	x28, x28, x26, x25
	mov	x26, 0x1a
	madd	x28, x28, x26, x25
	mov	x26, 0x4
	madd	x28, x28, x26, x25
	mov	x26, 0x70
	madd	x28, x28, x26, x25
	mov	x26, 0x72d
	mul	x28, x28, x26
	mov	x26, 0xad2b
	mul	x28, x28, x26
	// 0x3048
	mov	x27, 0x13bd
	mov	x26, 0x35dd
	mul	x27, x27, x26
	mov	x26, 0xc362
	madd	x27, x27, x26, x25
	mov	x26, 0x3d
	mul	x27, x27, x26
	mov	x26, 0xed80
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0x40]

	// 0x3050
	mov	x28, 0x1799
	mov	x26, 0x9e92
	madd	x28, x28, x26, x25
	mov	x26, 0x2c
	madd	x28, x28, x26, x25
	mov	x26, 0x6340
	mul	x28, x28, x26
	mov	x26, 0xd810
	mul	x28, x28, x26
	// 0x3058
	mov	x27, 0x43
	mov	x26, 0x83b1
	mul	x27, x27, x26
	mov	x26, 0xf1a0
	madd	x27, x27, x26, x25
	mov	x26, 0x8
	madd	x27, x27, x26, x25
	mov	x26, 0xb15
	mul	x27, x27, x26
	mov	x26, 0xd01
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0x50]

	// 0x3060
	mov	x28, 0x6d
	mov	x26, 0xd64e
	madd	x28, x28, x26, x25
	mov	x26, 0x5110
	madd	x28, x28, x26, x25
	mov	x26, 0x1561
	mul	x28, x28, x26
	mov	x26, 0x564b
	mul	x28, x28, x26
	// 0x3068
	mov	x27, 0x1
	mov	x26, 0xfe14
	madd	x27, x27, x26, x25
	mov	x26, 0x2
	madd	x27, x27, x26, x25
	mov	x26, 0x7258
	madd	x27, x27, x26, x25
	mov	x26, 0x13
	mul	x27, x27, x26
	mov	x26, 0x1bc5
	mul	x27, x27, x26
	mov	x26, 0x1f99
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0x60]

	// 0x3070
	mov	x28, 0x8
	mov	x26, 0xa468
	madd	x28, x28, x26, x25
	mov	x26, 0x2
	madd	x28, x28, x26, x25
	mov	x26, 0x361c
	mul	x28, x28, x26
	mov	x26, 0xfa25
	madd	x28, x28, x26, x25
	mov	x26, 0x3dbb
	mul	x28, x28, x26
	// 0x3078
	mov	x27, 0x47
	mov	x26, 0x167c
	madd	x27, x27, x26, x25
	mov	x26, 0x4
	madd	x27, x27, x26, x25
	mov	x26, 0x4
	mul	x27, x27, x26
	mov	x26, 0xab47
	madd	x27, x27, x26, x25
	mov	x26, 0x2ac
	mul	x27, x27, x26
	mov	x26, 0xd697
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0x70]

	// 0x3080
	mov	x28, 0x2
	mov	x26, 0xddb1
	madd	x28, x28, x26, x25
	mov	x26, 0x10f7
	mul	x28, x28, x26
	mov	x26, 0x2d2e
	madd	x28, x28, x26, x25
	mov	x26, 0x2c
	mul	x28, x28, x26
	mov	x26, 0x95bd
	mul	x28, x28, x26
	// 0x3088
	mov	x27, 0x1c8d
	mov	x26, 0x5a3a
	madd	x27, x27, x26, x25
	mov	x26, 0xfda
	madd	x27, x27, x26, x25
	mov	x26, 0xf218
	madd	x27, x27, x26, x25
	mov	x26, 0x2
	madd	x27, x27, x26, x25
	mov	x26, 0x76
	madd	x27, x27, x26, x25
	stp	x28, x27, [x30, 0x80]

	// 0x3090
	mov	x28, 0xce
	mov	x26, 0xc692
	madd	x28, x28, x26, x25
	mov	x26, 0xe
	madd	x28, x28, x26, x25
	mov	x26, 0x21d
	mul	x28, x28, x26
	mov	x26, 0xcae
	mul	x28, x28, x26
	mov	x26, 0x9dbf
	mul	x28, x28, x26
	// 0x3098
	mov	x27, 0x5f9
	mov	x26, 0x724a
	madd	x27, x27, x26, x25
	mov	x26, 0x100c
	madd	x27, x27, x26, x25
	mov	x26, 0x67
	mul	x27, x27, x26
	mov	x26, 0x17c2
	madd	x27, x27, x26, x25
	mov	x26, 0xa
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0x90]

	// 0x30a0
	mov	x28, 0x1a
	mov	x26, 0xa41e
	madd	x28, x28, x26, x25
	mov	x26, 0x59
	mul	x28, x28, x26
	mov	x26, 0x3fb
	mul	x28, x28, x26
	mov	x26, 0xc91
	mul	x28, x28, x26
	mov	x26, 0xca67
	mul	x28, x28, x26
	// 0x30a8
	mov	x27, 0x8
	mov	x26, 0x9962
	madd	x27, x27, x26, x25
	mov	x26, 0x2
	madd	x27, x27, x26, x25
	mov	x26, 0x4
	madd	x27, x27, x26, x25
	mov	x26, 0x2
	madd	x27, x27, x26, x25
	mov	x26, 0x3c38
	madd	x27, x27, x26, x25
	mov	x26, 0x31
	mul	x27, x27, x26
	mov	x26, 0xedce
	madd	x27, x27, x26, x25
	mov	x26, 0x1c
	madd	x27, x27, x26, x25
	mov	x26, 0x2
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0xa0]

	// 0x30b0
	mov	x28, 0x40
	mov	x26, 0xa696
	madd	x28, x28, x26, x25
	mov	x26, 0x68
	madd	x28, x28, x26, x25
	mov	x26, 0x4eaf
	mul	x28, x28, x26
	mov	x26, 0xc244
	madd	x28, x28, x26, x25
	mov	x26, 0x32
	mul	x28, x28, x26
	// 0x30b8
	mov	x27, 0xd
	mov	x26, 0xdc1c
	madd	x27, x27, x26, x25
	mov	x26, 0x40c
	madd	x27, x27, x26, x25
	mov	x26, 0xc56
	madd	x27, x27, x26, x25
	mov	x26, 0x2
	madd	x27, x27, x26, x25
	mov	x26, 0x35
	mul	x27, x27, x26
	mov	x26, 0xf69e
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0xb0]

	// 0x30c0
	mov	x28, 0x317
	mov	x26, 0xc268
	mul	x28, x28, x26
	mov	x26, 0xdb67
	madd	x28, x28, x26, x25
	mov	x26, 0x7d
	mul	x28, x28, x26
	mov	x26, 0xf722
	mul	x28, x28, x26
	// 0x30c8
	mov	x27, 0x368
	mov	x26, 0xe3c2
	madd	x27, x27, x26, x25
	mov	x26, 0x29
	mul	x27, x27, x26
	mov	x26, 0xe782
	madd	x27, x27, x26, x25
	mov	x26, 0x2
	madd	x27, x27, x26, x25
	mov	x26, 0xf098
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0xc0]

	// 0x30d0
	mov	x28, 0xa241
	mov	x26, 0xfbb6
	madd	x28, x28, x26, x25
	mov	x26, 0x806
	madd	x28, x28, x26, x25
	mov	x26, 0x2
	madd	x28, x28, x26, x25
	mov	x26, 0x182
	madd	x28, x28, x26, x25
	mov	x26, 0xbe7
	mul	x28, x28, x26
	// 0x30d8
	mov	x27, 0x56
	mov	x26, 0xb165
	madd	x27, x27, x26, x25
	mov	x26, 0xe8
	madd	x27, x27, x26, x25
	mov	x26, 0x1a
	madd	x27, x27, x26, x25
	mov	x26, 0x407d
	mul	x27, x27, x26
	mov	x26, 0x7fb7
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0xd0]

	// 0x30e0
	mov	x28, 0xc41
	mov	x26, 0x4267
	mul	x28, x28, x26
	mov	x26, 0xe378
	madd	x28, x28, x26, x25
	mov	x26, 0x7c
	mul	x28, x28, x26
	mov	x26, 0x8326
	mul	x28, x28, x26
	// 0x30e8
	mov	x27, 0x7bb
	mov	x26, 0x5ace
	madd	x27, x27, x26, x25
	mov	x26, 0x7
	mul	x27, x27, x26
	mov	x26, 0xa9fa
	madd	x27, x27, x26, x25
	mov	x26, 0x1c
	mul	x27, x27, x26
	mov	x26, 0x8092
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0xe0]

	// 0x30f0
	mov	x28, 0x10
	mov	x26, 0x84d3
	mul	x28, x28, x26
	mov	x26, 0xb53f
	madd	x28, x28, x26, x25
	mov	x26, 0x66e
	mul	x28, x28, x26
	mov	x26, 0x97de
	madd	x28, x28, x26, x25
	mov	x26, 0x8
	madd	x28, x28, x26, x25
	// 0x30f8
	mov	x27, 0x5bf
	mov	x26, 0x81c5
	mul	x27, x27, x26
	mov	x26, 0xfc8c
	madd	x27, x27, x26, x25
	mov	x26, 0x77
	mul	x27, x27, x26
	mov	x26, 0x864b
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0xf0]

	// 0x3100
	mov	x28, 0xac4
	mov	x26, 0xe20f
	madd	x28, x28, x26, x25
	mov	x26, 0xb
	mul	x28, x28, x26
	mov	x26, 0xa3ba
	madd	x28, x28, x26, x25
	mov	x26, 0x4
	mul	x28, x28, x26
	mov	x26, 0xab86
	mul	x28, x28, x26
	// 0x3108
	mov	x27, 0x1
	mov	x26, 0x3b26
	madd	x27, x27, x26, x25
	mov	x26, 0x157
	mul	x27, x27, x26
	mov	x26, 0x9e6e
	madd	x27, x27, x26, x25
	mov	x26, 0xc8
	mul	x27, x27, x26
	mov	x26, 0xe0db
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0x100]

	// 0x3110
	mov	x28, 0x1576
	mov	x26, 0x8bb2
	madd	x28, x28, x26, x25
	mov	x26, 0x2
	madd	x28, x28, x26, x25
	mov	x26, 0x18fe
	madd	x28, x28, x26, x25
	mov	x26, 0x58
	mul	x28, x28, x26
	mov	x26, 0xe42d
	mul	x28, x28, x26
	// 0x3118
	mov	x27, 0x4
	mov	x26, 0xcbd1
	madd	x27, x27, x26, x25
	mov	x26, 0xfe
	madd	x27, x27, x26, x25
	mov	x26, 0x78
	mul	x27, x27, x26
	mov	x26, 0x95bd
	mul	x27, x27, x26
	mov	x26, 0x9d6d
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0x110]

	// 0x3120
	mov	x28, 0x1c
	mov	x26, 0xebde
	mul	x28, x28, x26
	mov	x26, 0xf2d8
	madd	x28, x28, x26, x25
	mov	x26, 0xe21
	mul	x28, x28, x26
	mov	x26, 0x84c9
	mul	x28, x28, x26
	// 0x3128
	mov	x27, 0x1
	mov	x26, 0xb026
	madd	x27, x27, x26, x25
	mov	x26, 0x142
	madd	x27, x27, x26, x25
	mov	x26, 0x2
	madd	x27, x27, x26, x25
	mov	x26, 0x351e
	mul	x27, x27, x26
	mov	x26, 0xc5a7
	madd	x27, x27, x26, x25
	mov	x26, 0x107
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0x120]

	// 0x3130
	mov	x28, 0x11c5
	mov	x26, 0x8e72
	madd	x28, x28, x26, x25
	mov	x26, 0xc1
	mul	x28, x28, x26
	mov	x26, 0xdca2
	madd	x28, x28, x26, x25
	mov	x26, 0x41c
	madd	x28, x28, x26, x25
	mov	x26, 0x8
	madd	x28, x28, x26, x25
	// 0x3138
	mov	x27, 0x1
	mov	x26, 0x74f8
	madd	x27, x27, x26, x25
	mov	x26, 0x1a
	madd	x27, x27, x26, x25
	mov	x26, 0x2
	mul	x27, x27, x26
	mov	x26, 0x9860
	madd	x27, x27, x26, x25
	mov	x26, 0x4
	madd	x27, x27, x26, x25
	mov	x26, 0x18e
	madd	x27, x27, x26, x25
	mov	x26, 0x12bc
	madd	x27, x27, x26, x25
	mov	x26, 0x8
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0x130]

	// 0x3140
	mov	x28, 0xca4
	mov	x26, 0x8e52
	madd	x28, x28, x26, x25
	mov	x26, 0x10
	madd	x28, x28, x26, x25
	mov	x26, 0xb8
	madd	x28, x28, x26, x25
	mov	x26, 0x31a
	madd	x28, x28, x26, x25
	mov	x26, 0x56c3
	mul	x28, x28, x26
	// 0x3148
	mov	x27, 0xe918
	mov	x26, 0xeb70
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0x140]

	// 0x3150
	mov	x28, 0x4
	mov	x26, 0xacf4
	mul	x28, x28, x26
	mov	x26, 0xc290
	madd	x28, x28, x26, x25
	mov	x26, 0x14e4
	mul	x28, x28, x26
	mov	x26, 0xcb00
	madd	x28, x28, x26, x25
	mov	x26, 0x5
	mul	x28, x28, x26
	// 0x3158
	mov	x27, 0x2
	mov	x26, 0xbf78
	madd	x27, x27, x26, x25
	mov	x26, 0x2
	mul	x27, x27, x26
	mov	x26, 0x8821
	mul	x27, x27, x26
	mov	x26, 0xca96
	madd	x27, x27, x26, x25
	mov	x26, 0x79e
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0x150]

	// 0x3160
	mov	x28, 0x4
	mov	x26, 0x905c
	madd	x28, x28, x26, x25
	mov	x26, 0x2
	madd	x28, x28, x26, x25
	mov	x26, 0x2
	madd	x28, x28, x26, x25
	mov	x26, 0x4
	madd	x28, x28, x26, x25
	mov	x26, 0x2da4
	madd	x28, x28, x26, x25
	mov	x26, 0x14a8
	mul	x28, x28, x26
	mov	x26, 0xdf36
	mul	x28, x28, x26
	// 0x3168
	mov	x27, 0x133
	mov	x26, 0x75ec
	madd	x27, x27, x26, x25
	mov	x26, 0x2
	madd	x27, x27, x26, x25
	mov	x26, 0xc0
	mul	x27, x27, x26
	stp	x28, x27, [x30, 0x160]

	ret
sokoban_entry:
	stp	x0, x1, [sp], 0x100		// Yes, positive offset! I promise this does no harm.
	bl	sokoban_update
	mov	x30, x29
	mov	x2, x0
	ldrb	w29, [sp, -0x1]
	ldp	x0, x1, [sp, -0x100]!
	str	x2, [x1, -0x8]!
	ret
print_result_entry:
	bl	print_result
final_flag:
	.ascii	"~~~赤より紅い夢~~~"
head_alignment:
	.balign	0x1000, 0x0				// For convenience of debugging.
pool:
head:
loop_beg:
	ldr	x28, [sp, -0x8]			// Load the creater address.
	cbz	x28, head_aft_destr		// Check whether it should be unmount.
	stp	x0, x1, [sp, 0x8]
	mov	x8, 0xd7
	mov	x0, x28
	mov	x1, 0x1000
	svc	0x0
	ldp	x0, x1, [sp, 0x8]
head_aft_destr:
	stp	x0, x1, [sp, 0x8]
	mov	x29, xzr
	adr	x28, head			// Use a new page.
	str	x28, [sp, -0x18]		// Store head address. It creates body.
	stp	x0, x1, [sp]
	ldp	x0, x1, [x28, 0x30]!
	ldrb	w2, [x28, -0x1]!
	mov	x27, x1
	eor	x1, x1, 0x1000
	eor	x1, x1, x27
	add	x0, x28, 0x2f000
	bfi	x0, xzr, 0x20, 0x1
	sub	x0, x0, 0x2f
	mov	x2, 0x7
	mov	x3, 0x32
	mov	x4, -0x1
	mov	x5, 0x0
	mov	x8, 0xde
	svc	0x0
	add	x30, x0, exec - tail
	mov	x25, x0
	ldp	x0, x1, [sp]
	ldr	w28, [x0]			// Load OP field of this instruction.
	bfi	x29, x28, 0x6, 0x4
	ldr	x28, [sp, -0x10]		// Load pool address.
	mov	x27, op_table - pool		// With aligning this immediate is too big for ADD, but it works when I don't use aligning.
	add	x29, x29, x27			// A certain offset to OP table.
	add	x29, x28, x29			// X28: pool address; X29: OP table offset.
copy_tail:
	ldr	x26, [sp, -0x10]
	add	x27, x26, tail - pool		// Source, begin.
	add	x26, x27, tail_enter_end - tail	// Source, end.
	// mov	x25, x30			// Destination, begin. Put it before, same in X25.
	adr	x20, specify_exec
copy_tail_loop:
	ldp	x23, x24, [x27], 0x10
	movk	x22, 0x5a54, lsl 0x30
	movk	x22, 0x1149, lsl 0x10
	movk	x22, 0xe333, lsl 0x20
	movk	x22, 0xc146
	eor	x23, x22, x23
	movk	x22, 0xca95, lsl 0x20
	movk	x22, 0x15b7
	movk	x22, 0x7497, lsl 0x30
	movk	x22, 0x5386, lsl 0x10
	eor	x24, x22, x24
	lsl	x22, x23, 0x8
	bfxil	x23, x23, 0x8, 0x8		// Optimizable. Not anymore now.
	bfxil	x22, x24, 0x38, 0x8
	bfi	x23, x22, 0x8, 0x8
	bfxil	x22, x24, 0x30, 0x8
	bfi	x24, x22, 0x38, 0x8
	bfxil	x22, x23, 0x28, 0x8
	bfi	x24, x22, 0x30, 0x8
	bfxil	x22, x23, 0x38, 0x8
	bfi	x23, x22, 0x28, 0x8
	bfxil	x22, x24, 0x18, 0x8
	bfi	x23, x22, 0x38, 0x8
	bfxil	x22, x24, 0x20, 0x8
	bfi	x24, x22, 0x18, 0x8
	bfxil	x22, x24, 0x10, 0x8
	bfi	x24, x22, 0x20, 0x8
	bfxil	x22, x23, 0x10, 0x8
	bfi	x24, x22, 0x10, 0x8
	bfi	x23, x24, 0x10, 0x8
	bfxil	x24, x23, 0x30, 0x8
	bfxil	x22, x23, 0x20, 0x8
	bfi	x23, x22, 0x30, 0x8
	bfxil	x22, x23, 0x18, 0x8
	bfi	x23, x22, 0x20, 0x8
	bfxil	x22, x24, 0x28, 0x8
	bfi	x23, x22, 0x18, 0x8
	lsr	x22, x22, 0x8
	bfi	x24, x22, 0x28, 0x8
	stp	x23, x24, [x25], 0x10
	cmp	x26, x27
	b.ne	copy_tail_loop
copy_tail_leave:
	ret	x20
	.balign	0x10, 0x0
specify_exec:
	mov	x27, x29
	mov	x25, x30
	add	x26, x29, 0x40
	adr	x20, aft_specify_exec
	b	copy_tail_loop
aft_specify_exec:
	sub	x30, x30, exec - tail
	ret
tail_alignment:
	.balign	0x1000, 0x0			// For convenience of debugging.
tail:
	stp	x0, x1, [sp]			// Unmount head page.
	ldr	x0, [sp, -0x18]
	mov	x1, 0x1000
	mov	x8, 0xd7
	svc	0x0
	ldp	x0, x1, [sp]
exec:
	stp	x29, x30, [sp, -0x30]!
	mov	x29, sp
	mov	x1, 0x0
	adrp	x0, sokoban_update
	add	x0, x0, :lo12:sokoban_update
	blr	x0
	cbnz	x0, exec
	sub	sp, sp, 0x40
	ldp	x29, x30, [sp, -0x1f0]!
	cmp	x29, x30
	b.eq	update_pc
	sbfx	x0, x29, 0x4, 0x1d
	movk	x0, 0x1453, lsl 0x20
	orn	x0, x0, x30
	mov	x8, 0x5d
	svc	0x0
update_pc:
	ldr	w29, [x0]
	sbfx	x29, x29, 0x4, 0x1a
	add	x0, x0, x29
aft_update_pc:
extend_head_in_tail:
	stp	x0, x1, [sp]
	mov	x8, 0xde
	adr	x28, tail
	add	x0, x28, 0x2f000
	bfi	x0, xzr, 0x20, 0x1
	mov	x1, 0x1000
	mov	x2, 0x7
	mov	x3, 0x32
	mov	x4, -0x1
	mov	x5, 0x0
	svc	0x0
	mov	x30, x0
	ldp	x0, x1, [sp]
	ldr	x29, [sp, -0x10]		// Address of pool.
	adr	x28, tail
	str	x28, [sp, -0x8]
	add	x29, x29, copy_head - pool
	br	x29
op_svc_secret:
	ldr	x30, [sp, -0x10]!		// Remember to keep it, what in X30 now.
	ldr	x29, [sp, -0x10]		// The address of the secret page. Maybe NULL.
	mov	x26, x8
	cbnz	x29, op_svc_aft_create_secret	// Initialize the secret page when not initialized.
	mov	w27, 0x71680000
	movk	w27, 0x9472
	str	w27, [sp, -0x24]
	sub	x27, sp, 0x70
	mov	x8, 0x7
	stp	x0, x1, [sp, 0x10]
	add	x1, x8, 0x1
	madd	x8, x8, x1, xzr
	mov	x0, 0xffe7
	sxth	x1, w0
	orn	x0, x8, x1
	mov	x2, x0
	mov	x1, x27
	eor	x0, x0, x0
	svc	0x0				// SYSCALL openat.
	orr	x8, x8, 0x7
	sub	x1, sp, 0x30
	and	x2, x8, 0x7
	mov	x3, x0
	svc	0x0				// SYSCALL read. FD is in X0 and kept.
	mov	x0, x3
	bfi	x8, xzr, 0x1, 0x2
	svc	0x0				// SYSCALL close..
	ldr	x8, [sp, -0x30]
	bfi	x0, x8, 0xc, 0x14
	movk	x0, 0x1453, lsl 0x20
	lsl	x8, x0, 0x10
	rbit	x8, x8
	mvn	x8, x8
	bfm	x1, x8, 0x4, 0x7
	mov	x8, 0xe
	bfi	x8, x1, 0x4, 0x4
	mov	x1, 0x1000
	mov	x2, 0x3
	mov	x3, 0x32
	mov	x4, -1
	mov	x5, xzr
	svc	0x0				// SYSCALL mmap.
	str	x0, [sp, -0x10]
	ldp	x0, x1, [sp, 0x10]
op_svc_aft_create_secret:
	ldr	x27, [sp], 0x10			// It's only for modify SP, with X27 useless.
	add	x30, x30, sokoban_entry - pool
	adr	x29, op_svc_secret_aft_sokoban
	ret
op_svc_key_reject:
	cmp	x29, 0x10
	b.eq	update_pc
	str	wzr, [sp, -0x34]!
	ldr	x29, [sp, -0x4]
	add	sp, sp, 0x34
	cbz	x29, update_pc
	adr	x30, update_pc
	ret
op_svc_secret_aft_sokoban:
	cmp	x29, 0x78
	b.ne	sokoban_key_move
	ldrh	w27, [sp, -0x1a]
	lsr	x28, x27, 0xb
	bfi	x28, x27, 0x5, 0xb
	add	x27, x28, 0x1
	lsr	x28, x27, 0x5
	bfi	x28, x27, 0xb, 0x5
	strh	w28, [sp, -0x1a]!
	ldr	w28, [sp, -0x1a]!
	mul	w28, w28, w28
	str	w28, [sp], 0x34
	adr	x30, update_pc
	ret
sokoban_key_move:
	cmp	x29, 0x70
	b.ls	sokoban_key_da
	cmp	x29, 0x74
	b.ls	sokoban_key_s
	cmp	x29, 0x77
	b.ne	op_svc_key_reject
	mov	x29, xzr
	b	sokoban_aft_key
sokoban_key_s:
	cmp	x29, 0x73
	b.ne	op_svc_key_reject
	mov	x29, 0x4
	b	sokoban_aft_key
sokoban_key_da:
	cmp	x29, 0x62
	b.ls	sokoban_key_a
	cmp	x29, 0x64
	b.ne	op_svc_key_reject
	mov	x29, 0x2
	b	sokoban_aft_key
sokoban_key_a:
	cmp	x29, 0x61
	b.ne	op_svc_key_reject
	mov	x29, 0x6
sokoban_aft_key:
	add	x29, x29, 0x2
	ror	x25, x26, x29
	and	x25, x25, 0x3
	mov	x28, xzr
	mov	x27, xzr
	ldr	x29, [sp, -0x20]
	bfxil	x28, x29, 0x30, 0xb		// X28: offset in memory.
	bfxil	x27, x29, 0x3b, 0x5		// X27: offset in register.
	mov	x30, x27
	bfi	x30, x28, 0x5, 0xb
	cmp	x30, 0x200
	b.hi	judge_flag
	add	x28, x29, x28, lsl 0x3
	movk	x28, 0x0, lsl 0x30
	lsl	x27, x27, 0x1
	lsl	x27, x25, x27
	add	x30, x30, 0x1
	bfi	x29, x30, 0x3b, 0x5
	bfxil	x30, x30, 0x5, 0xb
	bfi	x29, x30, 0x30, 0xb
	str	x29, [sp, -0x20]
	ldr	x29, [x28]
	orr	x29, x27, x29
	str	x29, [x28]
	tst	x26, 0x4000
	b.eq	update_pc
judge_flag:
	ldr	x29, [sp, -0x10]!
	add	x29, x29, final_flag - pool
	ldp	x28, x30, [x29]
	ldr	x29, [x29, 0x10]
	ldr	x25, [sp, -0x10]
	movk	x25, 0x0, lsl 0x30
	ldp	x27, x26, [x25]
	ldr	x25, [x25, 0x10]
	sub	x29, x29, x25
	sub	x28, x27, x28
	sub	x30, x30, x26
	orr	x30, x28, x30
	orr	x30, x29, x30
	ldr	x0, [sp]
	add	x0, x0, print_result_entry - pool
	eor	x0, x0, x30
	eor	x30, x30, x0
	eor	x0, x0, x30
	ldr	w29, [sp, -0x24]
	mov	x28, 0xc1810000
	sub	x29, x29, x28
	orr	x0, x29, x0
	ret
	.balign	0x10, 0x0
tail_enter_end:
	.balign	0x40, 0x0
op_table:
op_svc: // case 0
	ldr	x8, [x1], 0x8
	tst	x8, 0x8000
	b.ne	op_svc + (op_svc_secret - exec)
	// ldr	x30, [sp, -0x10]
	// add	x30, x30, sokoban_entry - pool
	// adr	x29, op_svc + (update_pc - exec)
	ret
op_svc_hw:
	stp	x0, x1, [sp, 0x8]!
	ldp	x8, x0, [x1, -0x8]
	ldp	x2, x3, [x1, 0x10]
	ldp	x4, x5, [x1, 0x20]
	ldr	x1, [x1, 0x8]
	svc	0x0
	mov	x29, x0
	ldp	x0, x1, [sp], -0x8
	str	x29, [x1, 0x28]!
	adr	x30, op_svc_end
	ret
	.balign	0x40, 0x0
op_svc_end:
op_psh: // case 1
	ldr	w29, [x0]
	lsr	x29, x29, 0x1b
	and	x29, x29, 0x18
	adr	x28, op_mov_tb
	add	x30, x28, x29
	ret
op_mov_tb:
	ldrb	w29, [x0, 0x4]
	b	op_psh_st
	ldrh	w29, [x0, 0x4]
	b	op_psh_st
	ldr	w29, [x0, 0x4]
	b	op_psh_st
	mov	x29, x1
op_psh_st:
	str	x29, [x1, -0x8]!
	adr	x30, op_psh_end
	ret
	.balign	0x40, 0x0
op_psh_end:
op_add: // case 2
	ldp	x29, x28, [x1]
	add	x29, x29, x28
	str	x29, [x1, 0x8]!
	adr	x30, op_add_end
	ret
	.balign	0x40, 0x0
op_add_end:
op_nor: // case 3
	ldp	x29, x28, [x1]
	orr	x29, x28, x29
	mvn	x29, x29
	str	x29, [x1, 0x8]!
	adr	x30, op_nor_end
	ret
	.balign	0x40, 0x0
op_nor_end:
op_ror: // case 4
	ldp	x29, x28, [x1]
	ror	x29, x28, x29
	str	x29, [x1, 0x8]!
	adr	x30, op_ror_end
	ret
	.balign	0x40, 0x0
op_ror_end:
op_mad: // case 5
	ldp	x27, x29, [x1], 0x10
	ldr	x28, [x1]
	madd	x29, x28, x29, x27
	str	x29, [x1]
	adr	x30, op_mad_end
	ret
	.balign	0x40, 0x0
op_mad_end:
op_slt: // case 6
	ldr	x29, [x1]
	cmp	x29, 0x0
	cset	x29, ls
	str	x29, [x1]
	adr	x30, op_slt_end
	ret
	.balign	0x40, 0x0
op_slt_end:
op_jmp: // case 7
	ldp	x29, x28, [x1], 0x10
	cbz	x29, op_jmp + (update_pc - exec)
	ldr	x0, [sp, -0x30]
	add	x0, x0, x28
op_jmp_join:
	b	op_jmp + (aft_update_pc - exec)	// A certain offset to jump over default PC modification.
	.balign	0x40, 0x0
op_jmp_end:
op_ldr: // case 8
	ldr	w29, [x0, 0x4]
	ldr	x29, [x1, x29]
	str	x29, [x1, -0x8]!
	adr	x30, op_ldr_end
	ret
	.balign	0x40, 0x0
op_ldr_end:
op_str: // case 9
	ldr	w29, [x0, 0x4]
	add	x29, x1, x29
	ldr	x28, [x1], 0x8
	str	x28, [x29]
	adr	x30, op_str_end
	ret
	.balign	0x40, 0x0
op_str_end:
op_pop: // case 10
	add	x1, x1, 0x8
	adr	x30, op_pop_end
	ret
	.balign	0x40, 0x0
op_pop_end:
op_table_end:
