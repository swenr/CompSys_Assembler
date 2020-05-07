%include "gt.asm"

covar
inarea: 	resb 70
outarea: 	times 70 db (' ')
         	db 0Ah
ingelezen: 	dd 0
inleiding
        	openin
        	openuit
inlezen:
		lees
     		mov [ingelezen], eax
        	uit [ingelezen]
        	cmp eax, 0
        	je einde
       		cld
        	mov ecx, 70
        	mov esi, inarea
        	mov edi, outarea
        	rep movsb
		schrijf
        	jmp inlezen

einde: 
		slot
