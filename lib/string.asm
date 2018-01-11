[SECTION .text]

; 到处函数
global	memcpy
global	memset

;*************************************************************************************************************
; memcpy(p_vaddr, BaseOfLoaderPhyAddr + p_offset, p_filesz);
; 依据内核的Program header table的信息进行类似memcpy()的内存复制
; p_vaddr: 段在内存中的虚拟地址
; p_offset: 段在文件中的偏移
; p_filesz: 段在文件中的地址
;*************************************************************************************************************
; ------------------------------------------------------------------------
; 内存拷贝，仿 memcpy
; ------------------------------------------------------------------------
; void* memcpy(void* es:pDest, void* ds:pSrc, int iSize);
; ------------------------------------------------------------------------
memcpy:
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
	jz	.2		; 计数器为零时跳出

	mov	al, [ds:esi]		; ┓
	inc	esi			; ┃
					; ┣ 逐字节移动
	mov	byte [es:edi], al	; ┃
	inc	edi			; ┛

	dec	ecx		; 计数器减一
	jmp	.1		; 循环
.2:
	mov	eax, [ebp + 8]	; 返回值

	pop	ecx
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp

	ret			; 函数结束，返回
; memcpy 结束-------------------------------------------------------------

; ------------------------------------------------------------------------
; void memset(void* p_dst, char ch, int size);
; ------------------------------------------------------------------------

memset:
	push	ebp
	mov		ebp, esp

	push	esi
	push	edi
	push	ecx

	mov		edi, [ebp + 8]	; Destination
	mov		edx, [ebp + 12]	; Char to be putted
	mov		ecx, [ebp + 16]	; Counter
.1:
	cmp		ecx, 0
	jz		.2

	mov		byte [edi], dl
	inc		edi

	dec		ecx
	jmp		.1
.2:
	pop		ecx
	pop		edi
	pop		esi
	mov		esp, ebp
	pop		ebp

	ret
