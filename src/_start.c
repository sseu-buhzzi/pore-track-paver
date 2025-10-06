#include <fcntl.h>
#include <stdint.h>
#include <unistd.h>

struct insn {
	uint32_t op: 4;
	int32_t nx: 26;
	uint32_t im: 2;
};

void interpret(struct insn *pc, uint64_t *sp);

int32_t _start() {
	uint8_t buf[1024];
	((uint64_t *) buf)[0x2f] = 0x2;
	((uint64_t *) buf)[0x3c] = ((uint64_t *) buf)[0x2f] * 0x88ac;
	((uint64_t *) buf)[0x3c] += 0xffff;
	((uint64_t *) buf)[0x27] = ((uint64_t *) buf)[0x3c] * 0xb8;
	((uint64_t *) buf)[0x2f] = ((uint64_t *) buf)[0x27] * 0xda12;
	((uint64_t *) buf)[0x2f] += 0xffff;
	((uint64_t *) buf)[0x2d] = ((uint64_t *) buf)[0x2f] * 0xdf22;
	((uint64_t *) buf)[0x2d] += 0xffff;
	((uint64_t *) buf)[0x2e] = ((uint64_t *) buf)[0x2d] * 0x2;
	((uint64_t *) buf)[0x2e] += 0xffff;
	((uint64_t *) buf)[0x33] = ((uint64_t *) buf)[0x2e] * 0xe;
	((uint64_t *) buf)[0x33] += 0xffff;
	((__uint128_t *) buf)[0x2f] = ((uint64_t *) buf)[0x33] * (__uint128_t) 0x17f9;
	((__uint128_t *) buf)[0x2f] = ((__uint128_t *) buf)[0x2f] * 0x25d3;

	*(int32_t *) buf = openat(AT_FDCWD, buf + 376, O_RDONLY);
	read(*(int32_t *) buf, buf + 4, 2);
	uint8_t pad[*(uint16_t *) (buf + 4)];
	for (*(uint32_t *) (buf + 6) = 0; *(uint32_t *) (buf + 6) < *(uint16_t *) (buf + 4); ++*(uint32_t *) (buf + 6)) {
		read(*(int32_t *) buf, pad + *(uint32_t *) (buf + 6), 4);
	}
	close(*(int32_t *) buf);

	interpret(
		(struct insn *) ((uint64_t) pad - 0x300000 & 0xffffffff0000),
		(uint64_t *) ((uint64_t) pad - 0x700000 & 0xffffffff0000)
	);
	return 0;
}
