[SECTION .data]
disp_pos	dd	0
[SECTION .text]
; export the function
global	disp_int
; This function outputs an int number on the screen. 
disp_int:
	push	ebp
	mov		ebp, esp
	mov 	esi, [ebp + 8]	; pszInfo, the number need to be outputted
	mov		edi, [disp_pos]	;
	mov		ah, 0Fh
