;*****************************************************************
;*         Tarea número 1  Arquitectura de Computadores          *
;*								 *
;* 	   Elaborado por: Emmanuel Rosales Salas 2013108931      *
;*	  		  Miuyin Yong Wong 2014079293            *
;*								 *
;*	   Profesor: Esteban Méndez				 *
;*	   							 *
;*****************************************************************
%include "/home/emmanuel/Desktop/TareaArqui/io.mac"

.DATA
   msgDia: db 'Ingrese el día: ',0
   msgMes: db 'Ingrese el mes: ',0
   msgAhno:db 'Ingrese el año: ',0
   slash: db '/',0
   confirm_msg1 db 'Confirma que esta es la fecha que desea evaluar? ',0
   confirm_msg2 db ' (y/n) ',0
   bisiesto: db "Es Bisiesto",0Dh,0Ah,0
   noesBisiesto: db "No es Bisiesto",0Dh,0Ah,0
  
   
  lunes:
	       db "#       #    #  ##    #  #######   ###### ",10
	       db "#       #    #  # #   #  #	   #	     ",10
	       db "#       #    #  #  #  #  #####     ###### ",10
	       db "#       #    #  #   # #  #	        #    ",10
	       db "######  ######  #    ##  #######   ###### ",10
	lenLunes: equ $-lunes

	martes:
		db "**       **   ****   ******    **********   ********  ********  ",10 
		db "** ** ** **  ******  **   **   **********   **        **        ",10 
		db "**  **   **  **  **  ** ***        **       *****     ********  ",10 
		db "**       **  ******  **  **        **       **              **  ",10 
		db "**       **  **  **  **   **       **       ********  ********  ",10 
	lenMartes: equ $-martes

	miercoles:
		db"%%      %%  %%%%%%%  %%%%%%  %%%%%%   %%%%%%  %%%%%%  %%      %%%%%%  %%%%%%  ",10
		db"% %    % %     %     %%      %%  %%%  %%      %    %  %%      %       %       ",10
		db"%  % %   %     %     %%%%    %%   %%  %%      %    %  %%      %%%%    %%%%%%  ",10
		db"%   %    %     %     %%      %%  %%   %%      %    %  %%      %            %  ",10
		db"%        %  %%%%%%%  %%%%%%  %%   %%  %%%%%%  %%%%%%  %%%%%%% %%%%%%  %%%%%%  ",10
	lenMiercoles: equ $-miercoles
	
	jueves:
	     db"JJJJJJJJJ  JJ     JJ   JJJJJJJ   JJ      JJ   JJJJJJJ  JJJJJJJJ ",10
	     db"    JJ     JJ     JJ   JJ         JJ    JJ    JJ       JJ       ",10
	     db"    JJ     JJ     JJ   JJJJ        JJ  JJ     JJJJ     JJJJJJJJ ",10
	     db"    JJ     JJ     JJ   JJ           JJJJ      JJ             JJ ",10
	     db"JJJJJ       JJJJJJ     JJJJJJJ       JJ       JJJJJJJ  JJJJJJJJ ",10
	lenJueves: equ $-jueves

	viernes:
		db"VV      VV  VVVVVVVV  VVVVVVV  VVVVV    vvvv   vv  vvvvvv  vvvvvvv ",10
		db" VV    VV      VV     VV       VV   V   vv vv  vv  vv      vv      ",10
		db"  VV  VV       VV     VVVV     VV vV    vv  vv vv  vvvv    vvvvvvv ",10
		db"   VVVV        VV     VV       VV  VV   vv   vvvv  vv           vv ",10
		db"    VV      VVVVVVVV  VVVVVVV  VV   VV  vv    vvv  vvvvvv  vvvvvvv ",10
	lenViernes: equ $-viernes

	sabado:
	     db"SSSSSSS  SSSSSSSSS  SSSSSSSS  SSSSSSSSS   SSSSSSS   SSSSSSSS  ",10
	     db"SS       SS     SS  SS    SS  SS     SS   SS    SS  SS    SS  ",10
	     db"SSSSSSS  SSSSSSSSS  SSSSSS    SSSSSSSSS   SS    SS  SS    SS  ",10
	     db"     SS  SS     SS  SS    SS  SS     SS   SS    SS  SS    SS  ",10
	     db"SSSSSSS  SS     SS  SSSSSSSS  SS     SS   SSSSSSS   SSSSSSSS  ",10
	lenSabado: equ $-sabado

	domingo:
		db"DDDDDD   DDDDDDDD  DDD    DDD   DDDDDDDD   DD    DD  DDDDDDD   DDDDDDDD ",10
		db"DD   DD  DD    DD  DDDD  DDDD      DD      DDD   DD  DD        DD    DD ",10
		db"DD   DD  DD    DD  DD  DD  DD      DD      DD DD DD  DD  DDD   DD    DD ",10
		db"DD   DD  DD    DD  DD      DD      DD      DD  D DD  DD   DD   DD    DD ",10
		db"DDDDDD   DDDDDDDD  DD      DD   DDDDDDDD   DD    DD  DDDDDDD   DDDDDDDD ",10
	lenDomingo: equ $-domingo   

.UDATA
    response resb 1             ; Reservo un byte en memoria para almacenar el resultado de la pregunta inicial.
    resultado resb 32           ; Reservo 32 bytes de memoria para almacenar el resultado final de la operación que calcula el día.
    dia resb 32			; Reservo 32 bytes de memoria para almacenar el día que ingresa el usuario.
    mes resb 32			; Reservo 32 bytes de memoria para almacenar el mes que ingresa el usuario.
    anno resb 32		; Reservo 32 bytes de memoria para almacenar el año que ingresa el usuario.
    
.CODE
     .STARTUP
     
inicio:

;    Este procedimiento imprime el mensaje de ingreso para la fecha
;    y guarda los datos que el usuario ingresa.

     PutStr msgDia               
     GetInt [dia]
     PutStr msgMes
     GetInt [mes]
     PutStr msgAhno
     GetInt [anno]
    
  
confirmacion:

;   Este procedimiento imprime en pantalla el mensaje de confirmación
;   al usuario para que este este seguro de la fecha que desea averiguar.
;	
     PutStr confirm_msg1
     PutInt [dia]	
     PutStr slash
     PutInt [mes]	 
     PutStr slash	
     PutInt [anno]	
     PutStr confirm_msg2

;    Guarda el resultado que el usuario ingresa diciendo si esta o no conforme con la fecha

     GetCh [response]
     cmp byte[response],'y'
     je verificarMes
     jne inicio	

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
    jmp salir
    ret

noBisiesto:
    PutStr noesBisiesto
    jmp salir
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

imprimir:
	mov eax,4
	mov ebx,1
	mov ecx,ecx
	mov edx,edx
	int 80h
        call revisaBisiesto
	ret
	
salir:
   .EXIT	                                 
