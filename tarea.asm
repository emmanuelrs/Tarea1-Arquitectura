;*****************************************************************
;*         Tarea número 1  Arquitectura de Computadores          *
;*								 *
;* 	   Elaborado por: Emmanuel Rosales Salas 2013108931      *
;*	  		  Miuyin Yong Wong 2014079293            *
;*								 *
;*	   Profesor: Esteban Méndez				 *
;*	   							 *
;*****************************************************************
%include "/home/emmanuelrs/Desktop/TareaArqui/io.mac"

.DATA

lunes:
	       db "L       U    U  NN    N  EEEEEE   SSSSSS ",10
	       db "L       U    U  N N   N  E 	   S	     ",10
	       db "L       U    U  N  N  N  EEEE     SSSSSS ",10
	       db "L       U    U  N   N N  E	        S    ",10
	       db "LLLLLL  UUUUUU  N    NN  EEEEEEE   SSSSSS ",10
	lenLunes: equ $-lunes

	martes:
		db "MM       MM    AA    RRRRR     TTTTTTTTTT   EEEEEEEE  SSSSSSSS  ",10 
		db "MM MM MM MM   AAAA   R   RR    TTTTTTTTTT   EE        SS        ",10 
		db "MM  MM   MM  AA  AA  RR RRR        TT       EEEEE     SSSSSSSS  ",10 
		db "MM       MM  AAAAAA  RR  RR        TT       EE              SS  ",10 
		db "MM       MM  AA  KK  RR   RR       TT       EEEEEEEE  SSSSSSSS  ",10 
	lenMartes: equ $-martes

	miercoles:
		db"MM      MM  IIIIIII  EEEEEE  RRRRRR   CCCCCC  OOOOOO  LL      EEEEEE  SSSSSS  ",10
		db"M M    M M     I     EE      RR  RRR  CC      O    O  LL      E       S       ",10
		db"M  M M   M     I     EEEE    RR   RR  CC      O    O  LL      EEEE    SSSSSS  ",10
		db"M   M    M     I     EE      RR  RR   CC      O    O  LL      E            S  ",10
		db"M        M  IIIIIII  EEEEEE  RR   RR  CCCCCC  OOOOOO  LLLLLLL EEEEEE  SSSSSS  ",10
	lenMiercoles: equ $-miercoles
	
	jueves:
	     db"JJJJJJJJJ  UU     UU   EEEEEEE   VV      VV   EEEEEEE  SSSSSSSS ",10
	     db"    JJ     UU     UU   EE         VV    VV    EE       SS       ",10
	     db"    JJ     UU     UU   EEEE        VV  VV     EEEE     SSSSSSSS ",10
	     db"    JJ     UU     UU   EE           VVVV      EE             SS ",10
	     db"JJJJJ       UUUUUU     EEEEEEE       VV       EEEEEEE  SSSSSSSS ",10
	lenJueves: equ $-jueves

	viernes:
		db"VV      VV  IIIIIIII  EEEEEEE  RRRRR    NNNN   NN  EEEEEE  SSSSSSS ",10
		db" VV    VV      II     EE       RR   R   NN NN  NN  EE      SS      ",10
		db"  VV  VV       II     EEEE     RR RR    NN  NN NN  EEEE    SSSSSSS ",10
		db"   VVVV        II     EE       RR  RR   NN   NNNN  EE           SS ",10
		db"    VV      IIIIIIII  EEEEEEE  RR   RR  NN    NNN  EEEEEE  SSSSSSS ",10
	lenViernes: equ $-viernes

	sabado:
	     db"SSSSSSS  AAAAAAAAA  BBBBBBBB  AAAAAAAAA   DDDDDDD   OOOOOOOO  ",10
	     db"SS       AA     AA  BB    BB  AA     AA   DD    DD  00    OO  ",10
	     db"SSSSSSS  AAAAAAAAA  BBBBBB    AAAAAAAAA   DD    DD  00    OO  ",10
	     db"     SS  AA     AA  BB    BB  AA     AA   DD    DD  00    OO  ",10
	     db"SSSSSSS  AA     AA  BBBBBBBB  AA     AA   DDDDDDD   00000000  ",10
	lenSabado: equ $-sabado

	domingo:
		db"DDDDDD   OOOOOOOO  MMM    MMM   IIIIIIII   NN    NN  GGGGGGG   OOOOOOOO ",10
		db"DD   DD  OO    OO  MMMM  MMMM      II      NNN   NN  GG        OO    OO ",10
		db"DD   DD  OO    OO  MM  MM  MM      II      NN NN NN  GG  GGG   OO    OO ",10
		db"DD   DD  OO    OO  MM      MM      II      NN  N NN  GG   GG   OO    OO ",10
		db"DDDDDD   OOOOOOOO  MM      MM   IIIIIIII   NN    NN  GGGGGGG   OOOOOOOO ",10
	

        lenDomingo: equ $-domingo

	instruccion1: db "Ingrese una fecha con el siguiente formato dd/mm/yyyy",0Dh,0Ah,0
       

	;fecha: db "__/__/____",10
	;lenFecha: equ $-fecha
	
	day: db "__",0
	lenDay: equ $-day 
	
	month: db "__",0
	lenMonth: equ $-month 

	year: db "____",0
	lenYear: equ $-year

	bisiesto: db "Es Bisiesto",0Dh,0Ah,0
        noesBisiesto: db "No es Bisiesto",0Dh,0Ah,0
	msjPregunta: db "Desea probar otra fecha? (y/n) ",0

.UDATA

        bufferLectura: resb 1024		
	lenLectura: equ $-bufferLectura
	fecha resb 32
	dia resb 32
	mes resb 32
	anno resb 32
        resultado resb 32
        response resb 1
	
.CODE
   .STARTUP
main:
    PutStr instruccion1
    GetStr fecha
    call determina
    jmp salir

determina:
        call determinarDay
        call determinarMonth 
        call determinarYear
        call atoiDia
        call atoiMes
        call atoiAnno
	call verificarMes
	call revisaBisiesto
determinarDay:
	mov bl,byte[fecha + 0] ; 
	mov byte[day + 0],bl
	mov cl,byte[fecha + 1]
	mov byte[day + 1],cl 
	ret
determinarMonth:
	mov bl,byte[fecha + 3]
	mov byte[month + 0],bl
	mov cl,byte[fecha + 4]
	mov byte[month + 1],cl
	ret 
determinarYear:
	mov bl,byte[fecha + 6]
	mov byte[year + 0], bl
	mov cl,byte[fecha + 7]
	mov byte[year + 1],cl
	mov bl, byte[fecha + 8]
	mov byte[year + 2],bl
	mov cl, byte[fecha + 9]
	mov byte[year + 3], cl
	ret
atoiDia:
        xor EAX,EAX
        mov AL,byte[day + 0]
        mov CL,byte[day + 1]
        sub AL,30h
        sub CL,30h
        mov BL,10
        mul bx
        add AX,CX
        mov [dia],AX
        ret
atoiMes: 
        xor EAX,EAX
        mov AL,byte[month + 0]
        mov CL,byte[month + 1]
        sub AL,30h
        sub CL,30h
        mov BL,10
        mul bx
        add AX,CX
        mov [mes],AX
        ret

atoiAnno: 
        xor EAX,EAX
        mov AL,byte[year + 0]
        sub AL,30h
        mov BX,1000
        mul BX
        mov [anno],AX
        xor EAX,EAX
        mov AL,byte[year + 1]
        sub AL,30h
        mov BX,100
        mul BX
        add [anno],AX
        xor EAX,EAX
        mov AL,byte[year + 2]
        sub AL,30h
        mov BX,10
        mul BX
        add [anno],AX
        xor EAX,EAX
        mov AL,byte[year + 3]
        sub AL,30h
        add [anno],AX
        ret

verificarMes:

;    Este procedimiento verifica si el mes que se ingresó es Enero o Febrero
;    esto debido a que la fórmula para determinar el día tiene como restricción
;    que si la fecha es enero se debe de tomar como el mes 13 del año anterior 
;    y si es febrero se debe tomar como el mes 14 del año anterior al ingresado.

     xor AX,AX
     mov AX,[mes]
     cmp AX,1
     je enero
     cmp AX,2
     je febrero
     jne determinarDia
     ret

enero:

;    Cambia los datos a como la fórmula necesita en el caso especial de enero

     mov AX,13
     mov [mes],AX
     mov BX,[anno]
     sub BX,1
     mov [anno],BX
     call determinarDia
     ret

febrero:

;    Cambia los datos a como la fórmula necesita en el caso especial de febrero

     mov AX,14
     mov [mes],AX
     mov BX,[anno]
     sub BX,1
     mov [anno],BX
     call determinarDia
     ret
  
	
determinarDia:

     xor EAX,EAX       ;Limpio el registro EAX
     xor EBX,EBX       ;Limpio el registro EBX
     xor ECX,ECX       ;Limpio el registro ECX   
     mov BX,[mes]      ;Cargo en el registro BX el contenido de [mes]
     mov AX,2          ;Cargo en el regitro AX el número 2.
     mul BX            ;Multiplico el contenido de AX por BX y lo guardo en AX --> 2*mes
     mov CX,[dia]      ;Cargo en el registro CX el contenido de [dia]	
     add AX,CX         ;Se suma el registro de AX y CX --> día + 2*mes
     mov CX,AX         ;Cargo el contenido de AX al registro CX para tener disponibles los registros AX y BX para futuras operaciones.
     mov BX,[mes]      ;Cargo en BX el contenido del mes.
     add BX,1          ;Se suma al contenido del mes más 1 para tener --> mes + 1
     mov AX,3          ;Se carga en el registro AX un 3
     mul BX            ;Se multiplica el contenido del registro AX por el de BX y se guarda en AX para tener --> 3*(mes + 1)
     xor EBX,EBX       ;Se hace una limpieza del registro EBX
     mov EDX,0         ;Se pone en 0 el registro EDX para limpiarlo y poder realizar divisiones y multiplicaciones
     mov BX,5          ;Se carga en el registro BX un 5
     div BX            ;Se divide el contenido de AX por BX guardando el resultado en AX para tener --> 3*(mes + 1) // 5
     add CX,AX         ;Se suma el registro CX más el contenido de la división para tener --> día + 2 * mes + 3 * (mes + 1) // 5
     mov AX,[anno]     ;Se carga el año en el registro AX
     add CX,AX         ;Se suma el contenido de AX con el de CX para tener --> día + 2 * mes + 3 * (mes + 1) // 5 + año
     mov BX,4          ;Se carga en el registro BX un 4
     mov EDX,0         ;Se carga un 0 en el registro EDX para limpiarlo y hacer la división  
     div BX            ;Se divide el contenido de AX y BX para obtener --> año // 4
     add CX,AX         ;Se suma el resultado guardado en AX a CX para obtener --> día + 2 * mes + 3 * (mes + 1) // 5 + año + (año // 4)
     mov EDX,0         ;Se carga un 0 en el registro EDX para limpiarlo y hacer la división 
     mov AX,[anno]     ;Se carga el año en el registro AX 
     mov BX,100        ;Se carga en el registro un 100
     div BX            ;Se divide el contenido de AX con BX y se guarda el resultado en AX para obtener --> año // 100 
     sub CX,AX         ;Se resta el contenido de CX  --> día + 2 * mes + 3 * (mes + 1) // 5 + año + (año // 4) - (año//100)
     mov EDX,0         ;Se carga un 0 en el registro EDX para limpiarlo y hacer la división 
     mov AX,[anno]     ;Se carga el contenido del año en el registro AX
     mov BX,400        ;Se carga en el registro BX un 400
     div BX            ;Se divide el contenido de AX con BX para tener --> (año//400)
     add CX,AX         ;Se suman --> día + 2 * mes + 3 * (mes + 1) // 5 + año + (año // 4) - (año//100) + (año // 400)
     add CX,2          ;Se suma un 2 --> día + 2 * mes + 3 * (mes + 1) // 5 + año + (año // 4) - (año//100) + (año // 400) + 2
     mov EDX,0         ;Se carga un 0 en el registro EDX para limpiarlo y hacer la división 
     mov AX,CX         ;Se mueve el contedio del CX al registro AX
     mov BX,7          ;Se carga en el registro BX un 7
     div BX            ;Se divide en contenido de AX con BX 
     mov [resultado],DX;Se guarda el residuo (%) en resultado para obtener el día de la semana que cayó la fecha.
     

verificaResultado:
	 cmp byte[resultado],1
         je esDomingo
	 cmp byte[resultado],2
         je esLunes
         cmp byte[resultado],3
         je esMartes
         cmp byte[resultado],4
         je esMiercoles
         cmp byte[resultado],5
         je esJueves
         cmp byte[resultado],6
         je esViernes
         cmp byte[resultado],0
         je esSabado
         ret

esLunes:
	mov ecx,lunes
	mov edx,lenLunes
	call imprimir
	ret

esMartes:
	mov ecx,martes
	mov edx,lenMartes
	call imprimir
	ret
 
esMiercoles:
	mov ecx,miercoles
	mov edx,lenMiercoles
	call imprimir
	ret	 

esJueves:

	mov ecx,jueves
	mov edx,lenJueves
	call imprimir	
	ret
esViernes:

	mov ecx,viernes
	mov edx,lenViernes
	call imprimir 
	ret

esSabado:

	mov ecx,sabado
	mov edx,lenSabado
	call imprimir
	ret

esDomingo:

	mov ecx,domingo
	mov edx,lenDomingo
	call imprimir
	ret

esBisiesto: 
    PutStr bisiesto
    call pregunta
    ret

noBisiesto:
    PutStr noesBisiesto
    call pregunta
    ret

revisaBisiesto: 
       mov AX,[anno]
       mov BX,400
       mov EDX,0
       div BX
       cmp DX,0
       je esBisiesto
       mov AX,[anno]
       mov BX,4
       mov EDX,0
       div BX
       cmp DX,0
       jne noBisiesto
       mov AX,[anno]
       mov EDX,0
       mov BX,100
       div BX
       cmp DX,0
       jne esBisiesto
       je noBisiesto
       jmp salir
     
pregunta:
      PutStr msjPregunta
      GetCh [response]
      cmp byte[response],'y'
      je main
      jne salir	


imprimir:
	mov eax,4
	mov ebx,1
	mov ecx,ecx
	mov edx,edx
	int 80h
	ret

salir:
    .EXIT
