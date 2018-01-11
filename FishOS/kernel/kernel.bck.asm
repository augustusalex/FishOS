org	0100h
	
	mov	ax, 0B800h
	mov	gs, ax
	mov	ah, 0Fh
	mov	al, 'Z'
	mov	[gs:((80*0 + 20) * 2)], ax
	jmp	$
