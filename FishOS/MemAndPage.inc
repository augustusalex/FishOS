GetMemorySize:
	; 得到内存数
	mov	ebx, 0			; ebx = 后续值, 开始时需为0
	mov	di, _MemChkBuf		; es:di 指向一个地址范围描述符结构
	
.MemChkLoop:
	mov	eax, 0E820h		; eax = 0000E820h
	mov	ecx, 20			; ecx = 地址范围描述符结构的大小
	mov	edx, 0534D4150h		; edx = 'SMAP'
	int	15h
	jc	.MemChkFail
	add	di, 20
	inc	dword [_dwMCRAcount]	; dwMCRAcount = ARDS的个数
	cmp	ebx, 0
	jne	.MemChkLoop
	jmp	.MemChkOK
.MemChkFail:
	mov	dword [_dwMCRAcount], 0
.MemChkOK:

;***************************************************************************
; DispMemInfo
; 功能: 显示内存信息
;***************************************************************************
DispMemInfo:
	push	esi
	push	edi
	push	ecx
	
	mov	esi, MemChkBuf
	mov 	ecx, [dwMCRNumber]	; for (int i = 0; i < [MCRNumber]; i++) {
					; //每次得到一个ADRS结构
.loop:					; for (int j = 0; j < 5; j++) {
	mov	edx, 5			; //每次得到一个ARDS中的成员, 共5个
	mov	edi, ARDStruct		;
.1:					;
	push	dword [esi]		;
	call 	DispInt			; DispInt(MemChkBuf[j * 4]);
					; //显示一个成员
	pop	eax			;
	stosd				; ARDStruct[j * 4] = MemChkBuf[j * 4];
	add	esi, 4			;
	dec	edx			;
	cmp	edx, 0			;
	jnz	.1			; }

	call	DispReturn		; printf("\n");

	cmp	dword	[dwType], 1	; if (Type == AddressRangeMemory) {
					; //AddressRangeMemory	:1
					; //AddressRangeReserved:2
	jne	.2
	mov 	eax, [dwBaseAddrLow]	;
	add	eax, [dwLengthL]	;
	cmp	eax, [dwMemSize]	; if (BaseAddrLow + LengthLow > MemSize)
	jb	.2			;
	mov	[dwMemSize], eax	; MemSize = BaseAddrLow + LengthLow;
.2:					; }
	loop	.loop			; }
					;
	call	DispReturn		; printf("\n");
	push	szRAMSize		;
	call	DispStr			; printf("RAM Size:");
	add	esp, 4			;

	push	dword [dwMemSize]	;
	call	DispInt			; DispInt(MemSize);
	add	esp, 4

	pop	ecx
	pop	edi
	pop	esi

	ret

