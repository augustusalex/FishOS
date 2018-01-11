[SECTION .text]

; ��������
global	memcpy
global	memset

;*************************************************************************************************************
; memcpy(p_vaddr, BaseOfLoaderPhyAddr + p_offset, p_filesz);
; �����ں˵�Program header table����Ϣ��������memcpy()���ڴ渴��
; p_vaddr: �����ڴ��е������ַ
; p_offset: �����ļ��е�ƫ��
; p_filesz: �����ļ��еĵ�ַ
;*************************************************************************************************************
; ------------------------------------------------------------------------
; �ڴ濽������ memcpy
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
	cmp	ecx, 0		; �жϼ�����
	jz	.2		; ������Ϊ��ʱ����

	mov	al, [ds:esi]		; ��
	inc	esi			; ��
					; �� ���ֽ��ƶ�
	mov	byte [es:edi], al	; ��
	inc	edi			; ��

	dec	ecx		; ��������һ
	jmp	.1		; ѭ��
.2:
	mov	eax, [ebp + 8]	; ����ֵ

	pop	ecx
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp

	ret			; ��������������
; memcpy ����-------------------------------------------------------------

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
