load: code tarea.o			
	ld -s -o tarea tarea.o io.o
code: tarea.asm
	nasm -f elf tarea.asm	
