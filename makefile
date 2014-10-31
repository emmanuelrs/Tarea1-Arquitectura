load: code tarea1.o			
	ld -s -o tarea1 tarea1.o io.o
code: tarea1.asm
	nasm -f elf tarea1.asm	
