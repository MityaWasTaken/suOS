dist/main.bin: kernel/boot/*.asm
	nasm -f bin kernel/boot/main.asm -o dist/main.bin
