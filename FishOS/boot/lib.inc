;
; -----------------------------------------------
; 显示AL中的数字
; -----------------------------------------------
DispAL:
	push	ecx
	push	edx
	push	edi

	mov	edi, [dwDispPos]

	mov	ah, 0Fh			; 0000b: 黑底	1111b: 白字
	mov	dl, al
	shr	al, 4
	mov	ecx, 2
.begin:
	and	al, 01111b
	cmp	al, 9
	ja	.1
	add	al, '0'
	jmp	.2
.1:
	sub	al, 0Ah
	add	al, 'A'
.2:
	mov	[gs:edi], ax
	add	edi, 2
	
	mov	al, dl
	loop	.begin
	;add	edi, 2

	mov	[dwDispPos], edi	; [dwDispPos]放置的是输出文字于屏幕上的位置, 输出过之后应该进行更新
	
	pop	edi
	pop	edx
	pop	ecx

	ret
; DispAL结束-------------------------------------


; -----------------------------------------------
; 显示一个整型数
; -----------------------------------------------
DispInt:
	push	eax
	
	mov	eax, [esp + 8]
	shr	eax, 24
	call	DispAL
	
	mov	eax, [esp + 8]
	shr	eax, 16
	call	DispAL
	
	mov	eax, [esp + 8]
	shr	eax, 8
	call	DispAL
	
	mov	eax, [esp + 8]
	call	DispAL
	
	mov	ah, 07h			; 0000b: 黑底 0111b: 灰字
	mov	al, 'h'
	push	edi
	mov	edi, [dwDispPos]
	mov	[gs:edi], ax
	add	edi, 4
	mov	[dwDispPos], edi
	pop	edi

	pop	eax
	ret
; DispInt结束------------------------------------

; -----------------------------------------------
; 显示一个字符串
; -----------------------------------------------
DispStr:
	push	ebp				; 调动这个方法之前, 先将要输出的字符串的偏移地址入栈, 然后将ebp入栈, 保存值
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
	push	eax

	mov	esi, [ebp + 8]	; pszInfo
	mov	edi, [dwDispPos]
	mov	ah, 0Fh

.1:
	lodsb
	test	al, al
	jz	.2
	cmp	al, 0Ah	; 是回车吗?
	jnz	.3
	push	eax
	mov	eax, edi
	mov	bl, 160
	div	bl
	and	eax, 0FFh
	inc	eax
	mov	bl, 160
	mul	bl
	mov	edi, eax
	pop	eax
	jmp	.1
.3:
	mov 	[gs:edi], ax
	add	edi, 2
	jmp	.1
.2:
	mov	[dwDispPos], edi
	
	pop	eax
	pop	edi
	pop	esi
	pop	ebx
	pop	ebp
	ret
; DispStr结束------------------------------------

; -----------------------------------------------
; 换行
; -----------------------------------------------
DispReturn:
	push	szReturn
	call	DispStr			; printf("\n");
	add	esp, 4

	ret
; DispReturn结束---------------------------------
	

; -----------------------------------------------
; 内存拷贝, 仿memcpy
; -----------------------------------------------
; void* MemCpy(void* es:pDest, void* ds:pSrc, int iSize);
; -----------------------------------------------
MemCpy:
	push	ebp
	mov	ebp, esp
	push	esi
	push	edi
	push	ecx

	mov	edi, [ebp + 8]	; Destination
	mov	esi, [ebp + 12]	; Source
	mov	ecx, [ebp + 16]	; Counter
.1:
	cmp	ecx, 0		; 判断计数器
	jz	.2		; 计数器为0时跳出
	
	; 逐字节移动
	mov	al, [cs:esi]		
	inc	esi
	
	mov	byte [es:edi], al
	inc	edi
	
	dec	ecx		; 计数器减一
	jmp	.1		; 循环
.2:
	mov	eax, [ebp + 8]	; 返回值
	
	pop	ecx
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp

	ret			; 函数结束, 返回
; MemCpy 结束------------------------------------

