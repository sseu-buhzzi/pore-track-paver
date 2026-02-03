						//  A  S  D  W
entry:
	psh	go_back
	psh	0x8272				// 10 01 11 00 10 - 10 A
	svc
	jmp

	psh	go_back
	psh	0x8387				// 11 10 00 01 11 - 11 A
	svc
	jmp

	psh	go_back
	psh	0x8387				// 11 10 00 01 11 - 11 A
	svc
	jmp

	psh	go_back
	psh	0x834b				// 11 01 00 10 11 - 01 S
	svc
	jmp

	psh	go_back
	psh	0x8393				// 11 10 01 00 11 - 10 S
	svc
	jmp

	psh	go_back
	psh	0x8272				// 10 01 11 00 10 - 11 D
	svc
	jmp

	psh	go_back
	psh	0x8139				// 01 00 11 10 01 - 11 D
	svc
	jmp

	psh	go_back
	psh	0x821e				// 10 00 01 11 10 - 01 D
	svc
	jmp

	psh	go_back
	psh	0x80d8				// 00 11 01 10 00 - 10 W
	svc
	jmp

	psh	go_back
	psh	0x81e1				// 01 11 10 00 01 - 11 S
	svc
	jmp

	psh	go_back
	psh	0x831b				// 11 00 01 10 11 - 11 A
	svc
	jmp

	psh	go_back
	psh	0x81e1				// 01 11 10 00 01 - 01 A
	svc
	jmp

	psh	go_back
	psh	0x806c				// 00 01 10 11 00 - 00 A
	svc
	jmp

	psh	go_back
	psh	0x81c9				// 01 11 00 10 01 - 10 W
	svc
	jmp

	psh	go_back
	psh	0x8139				// 01 00 11 10 01 - 10 W
	svc
	jmp

	psh	go_back
	psh	0x8236				// 10 00 11 01 10 - 11 D
	svc
	jmp

	psh	go_back
	psh	0x809c				// 00 10 01 11 00 - 01 D
	svc
	jmp

	psh	go_back
	psh	0x82d2				// 10 11 01 00 10 - 01 D
	svc
	jmp

	psh	go_back
	psh	0x831b				// 11 00 01 10 11 - 11 A
	svc
	jmp

	psh	go_back
	psh	0x82c6				// 10 11 00 01 10 - 10 A
	svc
	jmp

	psh	go_back
	psh	0x825e				// 10 01 01 11 10 - 00 X
	svc
	jmp

	psh	go_back
	psh	0x8139				// 01 00 11 10 01 - 01 A
	svc
	jmp

	psh	go_back
	psh	0x821e				// 10 00 01 11 10 - 10 A
	svc
	jmp

	psh	go_back
	psh	0x81c9				// 01 11 00 10 01 - 10 W
	svc
	jmp

	psh	go_back
	psh	0x809c				// 00 10 01 11 00 - 11 W
	svc
	jmp

	psh	go_back
	psh	0x834b				// 11 01 00 10 11 - 00 D
	svc
	jmp

	psh	go_back
	psh	0x812d				// 01 00 10 11 01 - 10 D
	svc
	jmp

	psh	go_back
	psh	0x80b4				// 00 10 11 01 00 - 11 D
	svc
	jmp

	psh	go_back
	psh	0x8363				// 11 01 10 00 11 - 10 D
	svc
	jmp

	psh	go_back
	psh	0x824e				// 10 01 00 11 10 - 00 D
	svc
	jmp

	psh	go_back
	psh	0x816d				// 01 01 10 11 01 - 00 X
	svc
	jmp

	psh	go_back
	psh	0x8387				// 11 10 00 01 11 - 10 S
	svc
	jmp

	psh	go_back
	psh	0x821e				// 10 00 01 11 10 - 00 S
	svc
	jmp

	psh	go_back
	psh	0x8139				// 01 00 11 10 01 - 10 W
	svc
	jmp

	psh	go_back
	psh	0x82d2				// 10 11 01 00 10 - 00 W
	svc
	jmp

	psh	go_back
	psh	0x82c6				// 10 11 00 01 10 - 10 A
	svc
	jmp

	psh	go_back
	psh	0x834b				// 11 01 00 10 11 - 11 A
	svc
	jmp

	psh	go_back
	psh	0x821e				// 10 00 01 11 10 - 00 S
	svc
	jmp

	psh	go_back
	psh	0x806c				// 00 01 10 11 00 - 10 D
	svc
	jmp

	psh	go_back
	psh	0x806c				// 00 01 10 11 00 - 11 W
	svc
	jmp

	psh	go_back
	psh	0x8272				// 10 01 11 00 10 - 10 A
	svc
	jmp

	psh	go_back
	psh	0x8276				// 10 01 11 01 10 - 00 X
	svc
	jmp

	psh	go_back
	psh	0x80b4				// 00 10 11 01 00 - 00 A
	svc
	jmp

	psh	go_back
	psh	0x82d2				// 10 11 01 00 10 - 10 A
	svc
	jmp

	psh	go_back
	psh	0x82d2				// 10 11 01 00 10 - 10 A
	svc
	jmp

	psh	go_back
	psh	0x8393				// 11 10 01 00 11 - 10 S
	svc
	jmp

	psh	go_back
	psh	0x821e				// 10 00 01 11 10 - 00 S
	svc
	jmp

	psh	go_back
	psh	0x812d				// 01 00 10 11 01 - 10 D
	svc
	jmp

	psh	go_back
	psh	0x8272				// 10 01 11 00 10 - 11 D
	svc
	jmp

	psh	go_back
	psh	0x82d2				// 10 11 01 00 10 - 01 D
	svc
	jmp

	psh	go_back
	psh	0x80e4				// 00 11 10 01 00 - 10 D
	svc
	jmp

	psh	go_back
	psh	0x809c				// 00 10 01 11 00 - 11 W
	svc
	jmp

	psh	go_back
	psh	0x8363				// 11 01 10 00 11 - 00 W
	svc
	jmp

	psh	go_back
	psh	0x809c				// 00 10 01 11 00 - 01 D
	svc
	jmp

	psh	go_back
	psh	0x806c				// 00 01 10 11 00 - 11 W
	svc
	jmp

	psh	go_back
	psh	0x831b				// 11 00 01 10 11 - 10 W
	svc
	jmp

	psh	go_back
	psh	0x81e1				// 01 11 10 00 01 - 01 A
	svc
	jmp

	psh	go_back
	psh	0x81c9				// 01 11 00 10 01 - 01 A
	svc
	jmp

	psh	go_back
	psh	0x806c				// 00 01 10 11 00 - 00 A
	svc
	jmp

	psh	go_back
	psh	0x82c6				// 10 11 00 01 10 - 10 A
	svc
	jmp

	psh	go_back
	psh	0x80d8				// 00 11 01 10 00 - 11 S
	svc
	jmp

	psh	go_back
	psh	0x8393				// 11 10 01 00 11 - 00 W
	svc
	jmp

	psh	go_back
	psh	0x806c				// 00 01 10 11 00 - 10 D
	svc
	jmp

	psh	go_back
	psh	0x8272				// 10 01 11 00 10 - 11 D
	svc
	jmp

	psh	go_back
	psh	0x831b				// 11 00 01 10 11 - 01 D
	svc
	jmp

	psh	go_back
	psh	0x8387				// 11 10 00 01 11 - 00 D
	svc
	jmp

	psh	go_back
	psh	0x821e				// 10 00 01 11 10 - 00 S
	svc
	jmp

	psh	go_back
	psh	0x81b1				// 01 10 11 00 01 - 10 S
	svc
	jmp

	psh	go_back
	psh	0x80b4				// 00 10 11 01 00 - 00 A
	svc
	jmp

	psh	go_back
	psh	0x812d				// 01 00 10 11 01 - 01 A
	svc
	jmp

	psh	go_back
	psh	0x81b1				// 01 10 11 00 01 - 00 W
	svc
	jmp

	psh	go_back
	psh	0x806c				// 00 01 10 11 00 - 10 D
	svc
	jmp

	psh	go_back
	psh	0x8139				// 01 00 11 10 01 - 01 A
	svc
	jmp

	psh	go_back
	psh	0x8363				// 11 01 10 00 11 - 01 S
	svc
	jmp

	psh	go_back
	psh	0x8387				// 11 10 00 01 11 - 10 S
	svc
	jmp

	psh	go_back
	psh	0x82d2				// 10 11 01 00 10 - 11 S
	svc
	jmp

	psh	go_back
	psh	0x81ed				// 01 11 10 11 01 - 00 X
	svc
	jmp

	psh	go_back
	psh	0x818d				// 01 10 00 11 01 - 01 A
	svc
	jmp

	psh	go_back
	psh	0x8236				// 10 00 11 01 10 - 10 A
	svc
	jmp

	psh	go_back
	psh	0x8236				// 10 00 11 01 10 - 10 A
	svc
	jmp

	psh	go_back
	psh	0x831b				// 11 00 01 10 11 - 10 W
	svc
	jmp

	psh	go_back
	psh	0x81e1				// 01 11 10 00 01 - 00 W
	svc
	jmp

	psh	go_back
	psh	0x8327				// 11 00 10 01 11 - 10 D
	svc
	jmp

	psh	go_back
	psh	0x81c9				// 01 11 00 10 01 - 10 W
	svc
	jmp

	psh	go_back
	psh	0x8139				// 01 00 11 10 01 - 10 W
	svc
	jmp

	psh	go_back
	psh	0x8078				// 00 01 11 10 00 - 11 D
	svc
	jmp

	psh	go_back
	psh	0x8078				// 00 01 11 10 00 - 11 D
	svc
	jmp

	psh	go_back
	psh	0x821e				// 10 00 01 11 10 - 01 D
	svc
	jmp

	psh	go_back
	psh	0x82c6				// 10 11 00 01 10 - 10 A
	svc
	jmp

	psh	go_back
	psh	0x834b				// 11 01 00 10 11 - 11 A
	svc
	jmp

	psh	go_back
	psh	0x831b				// 11 00 01 10 11 - 11 A
	svc
	jmp

	psh	go_back
	psh	0x834b				// 11 01 00 10 11 - 01 S
	svc
	jmp

	psh	go_back
	psh	0x809c				// 00 10 01 11 00 - 10 S
	svc
	jmp

	psh	go_back
	psh	0x80b4				// 00 10 11 01 00 - 11 D
	svc
	jmp

	psh	go_back
	psh	0x8078				// 00 01 11 10 00 - 11 D
	svc
	jmp

	psh	go_back
	psh	0x8393				// 11 10 01 00 11 - 01 D
	svc
	jmp

go_back:
	psh	0xc287				// 10 10 00 01 11
	svc
	psh	entry
	psh	0x514
	jmp
