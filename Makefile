.PHONY: all
all: build cp_to_pwd

.PHONY: build
build: out/crackme

.PHONY: run
run: out/crackme
	out/crackme;

.PHONY: cp_to_pwd
cp_to_pwd: out/crackme
	cp out/crackme track_paver;

.PHONY: debug
debug: out/crackme-raw out/crackme
	objdump -d $< >$<.dsm;
	objdump -d out/crackme >out/crackme.dsm;
	readelf -Wa out/crackme >out/crackme-readelf.txt;

out/crackme: out/crackme-raw
	python3 src/encr-tail $@ 0x4000 0x45c0;
	strip $@;
	dd bs=1 conv=notrunc if=/dev/zero of=$@ seek=12288 count=364;

out/crackme-raw: out/svc/_start-svc.o src/track_paver.s src/decr-imem.s out/svc/sokoban-svc.o out/normal/gloceries.o
	gcc -nostartfiles -o out/crackme-raw $^;

out/svc/%-svc.o: src/%.c
	@mkdir -p out/svc;
	gcc -O0 -S -o out/$*.s $<;
	python3 src/convert-svc out/$*;
	gcc -c -o $@ out/$*-svc.s;
	@rm -f out/$*.s out/$*-svc.s;

out/normal/%.o: src/%.c
	@mkdir -p out/normal;
	gcc -c -o $@ $<;

.PHONY: clean
clean:
	rm -f track_paver;
	rm -fr out;
