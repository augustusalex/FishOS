GetMemorySize:
	; �õ��ڴ���
	mov	ebx, 0			; ebx = ����ֵ, ��ʼʱ��Ϊ0
	mov	di, _MemChkBuf		; es:di ָ��һ����ַ��Χ�������ṹ
	
.MemChkLoop:
	mov	eax, 0E820h		; eax = 0000E820h
	mov	ecx, 20			; ecx = ��ַ��Χ�������ṹ�Ĵ�С
	mov	edx, 0534D4150h		; edx = 'SMAP'
	int	15h
	jc	.MemChkFail
	add	di, 20
	inc	dword [_dwMCRAcount]	; dwMCRAcount = ARDS�ĸ���
	cmp	ebx, 0
	jne	.MemChkLoop
	jmp	.MemChkOK
.MemChkFail:
	mov	dword [_dwMCRAcount], 0
.MemChkOK:

;***************************************************************************
; DispMemInfo
; ����: ��ʾ�ڴ���Ϣ
;***************************************************************************
DispMemInfo:
	push	esi
	push	edi
	push	ecx
	
	mov	esi, MemChkBuf
	mov 	ecx, [dwMCRNumber]	; for (int i = 0; i < [MCRNumber]; i++) {
					; //ÿ�εõ�һ��ADRS�ṹ
.loop:					; for (int j = 0; j < 5; j++) {
	mov	edx, 5			; //ÿ�εõ�һ��ARDS�еĳ�Ա, ��5��
	mov	edi, ARDStruct		;
.1:					;
	push	dword [esi]		;
	call 	DispInt			; DispInt(MemChkBuf[j * 4]);
					; //��ʾһ����Ա
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
