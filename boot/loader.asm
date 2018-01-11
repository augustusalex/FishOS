org	0100h

BaseOfStack			equ	0100h
BaseOfKernel		equ	08000h			; Kernel.bin�����ص���λ�� --->   �λ�ַ
OffsetOfKernel		equ	0h			; Kernel.bin�����ص���λ�� ---> ƫ�Ƶ�ַ
BaseOfKernelPhyAddr	equ	BaseOfKernel	* 10h	; Kernel.bin�����ص���λ��, �����ַ

BaseOfLoader		equ	09000h			; Loader.bin�����ص���λ�� --->	  �λ�ַ
OffsetOfLoader		equ	0100h			; Loader.bin�����ص���λ�� ---> ƫ�Ƶ�ַ
BaseOfLoaderPhyAddr	equ	BaseOfLoader	* 10h	; Loader.bin�����ص���λ��, �����ַ

KernelEntryPointPhyAddr	equ 	030400h

jmp	LABEL_START

%include "pm.inc"
%include "FAT32Head.inc"

LABEL_GDT:		Descriptor	0,	 0,		0				; ��������
LABEL_DESC_FLAT_C:	Descriptor	0,	 0fffffh,	DA_CR | DA_32  | DA_LIMIT_4K	; 0 ~ 4G�Ŀ�ִ�ж�
LABEL_DESC_FLAT_RW:	Descriptor	0, 	 0fffffh,	DA_DRW| DA_32  | DA_LIMIT_4K	; 0 ~ 4G�Ŀɶ�д��
LABEL_DESC_VIDEO:	Descriptor	0B8000h, 0ffffh,	DA_DRW| DA_DPL3		; ָ���Դ�Ķ�

GdtLen		equ	$ - LABEL_GDT
GdtPtr		dw	GdtLen - 1				; �ν���
		dd	BaseOfLoaderPhyAddr + LABEL_GDT	; ����ַ

; ѡ����
SelectorFlatC		equ	LABEL_DESC_FLAT_C	- LABEL_GDT
SelectorFlatRW		equ	LABEL_DESC_FLAT_RW	- LABEL_GDT
SelectorVideo		equ	LABEL_DESC_VIDEO	- LABEL_GDT + SA_RPL3

LABEL_START:
	mov	ax, cs
	mov	ds, ax
	mov	es, ax
	mov	ss, ax
	mov	sp, BaseOfStack

	; ����
	mov	ax, 0600h
	mov	bx, 0700h
	mov	cx, 0
	mov	dx, 0184fh
	int	10h
	
	;�ڸ�Ŀ¼��Ѱ��Kernel.bin�ļ�, �����ؽ����ڴ�
	mov	dx, 0000h		; �ڵ�0�����"Loading.."�ַ���
	call	DispStrRealMode

	mov	ax, BaseOfKernel
	mov	es, ax
	mov	bx, OffsetOfKernel
	mov	ax, 063eh
	mov	cl, 1
	call	ReadSector

	mov	si, KernelFileName	; ds:si ---> "KERNEL  BIN"
	mov	di, OffsetOfKernel	; es:di ---> BaseOfKernel:OffsetOfKernel
	cld
	mov	dx, 10h
.FindKernel:
	cmp	dx, 0h
	dec	dx
	mov	cx, 11
; �Ƚ��ļ����Ƿ�ƥ��
.CMPFileName:
	cmp	cx, 0
	jz	.FindSuccess
	dec	cx
	lodsb
	mov	ah, byte [es:di]
	cmp	ah, al
	jz	.GoOn

	; ƥ��ʧ��, ������һ��Ŀ¼��
	; ���Ȼظ�si�Ĵ�����ֵ, Ȼ��di�Ĵ�����ֵָ����һ��Ŀ¼�����ʼλ��
	mov	si, KernelFileName
	and	di, 0FFE0h
	add	di, 20h
	jmp	.FindKernel

.GoOn:
	inc	di
	jmp	.CMPFileName

.FindFail:
	mov	dx, 0101h
	call	DispStrRealMode
	jmp	$

.FindSuccess:
	mov	dx, 0202h
	call	DispStrRealMode
	push	ax
	mov	ax, BaseOfKernel
	mov	es, ax
	pop	ax
	and	di, 0FFE0h
	add	di, 14h
	mov	ax, word [es:di]
	shl	eax, 16
	add	di, 6h
	mov	ax, word [es:di]
	push	eax
	add	ax, SectorsOfDict
	sub	eax, 2
	push	eax
	mov	ax, BaseOfKernel
	mov	es, ax			; BaseOfKernel 		---> es
	mov	bx, OffsetOfKernel	; OffsetOfKernel	---> bx, es:bx
	pop	eax			; Kernel.bin��������	---> eax

.LoadingFile:
	push	eax
	push	ebx
	mov	ah,0Eh
	mov	al, '.'
	mov	bl, 0Fh
	int 	10h
	pop	ebx
	pop	eax
	
	mov	cl, 1
	call	ReadSector


	pop	eax			; ȡ��Kernel.bin�ļ���FAT���е����
	call	GetFATEntry		; ��ȡ��һ���߼����
	cmp	eax, 0FFFFFF8h		; �ж��Ƿ������һ����, �����ڵ���0FFFFFF8hʱ, ��ʾ�˿�Ϊ���һ��
	jc	.LoadContinue

	call	KillMotor
	mov	dx, 0303h
	call	DispStrRealMode

	; ����׼�����뱣��ģʽ
	; ����gdtr
	lgdt	[GdtPtr]
	; ���ж�
	cli
	; ��A20��ַ��
	in	al, 92h
	or	al, 00000010b
	out	92h, al

	mov	eax, cr0
	or	eax, 1
	mov	cr0, eax

;	jmp 	$

	; �������뱣��ģʽ
	jmp	dword	SelectorFlatC:(BaseOfLoaderPhyAddr + LABEL_PM_START)

.LoadContinue:
	push	eax			; eax�д����һ���߼�������
	add	eax, SectorsOfDict	
	sub	eax, 2			; �õ���һ������������������
	add	bx, [BytesPerSector]
	jmp	.LoadingFile

MessageLength	equ	9		; ����ÿ���ַ����ĳ���Ϊ11�ֽ�
LoadingMessage	db	"Loading.."
NoKernel	db	"No Kernel"
KernelFound	db	"Kernel OK"
Ready		db	"Ready...."
KernelFileName	db	"KERNEL  BIN"

;*************************************************************************************************************
; KillMotor
; ����: �ر��������, ���������ĵƻ᳣��
;*************************************************************************************************************
KillMotor:
	push	dx
	mov 	dx, 03f2h
	mov 	al, 0
	out 	dx, al
	pop	dx
	ret

;*************************************************************************************************************
; GetFATEntry
; ��ȡFAT���е�eax��FAT�����е�ֵ
;*************************************************************************************************************
GetFATEntry:
	push	es
	push	ebx
	push	eax

	mov	ax, BaseOfKernel
	sub	ax, 1000h		; ��BaseOfLoader֮ǰԤ��4KB���FAT�������
	mov	es, ax

	; eax�м�¼Loader.bin��һ���������߼����, Ҳ��Ӧ��FAT�������Ӧ�ı���
	; ������ô˱�������FAT���еĵڼ�������
	; һ��FAT����Ϊ4B, һ������Ϊ512B, ����һ��������128������
	pop	eax
	mov	ecx, eax
	shr	eax, 16		; ��ñ�������16λ, ����dx��
	mov	dx, ax
	xor	eax, eax
	mov	ax, cx		; ��ȡ��������16λ, ����ax��
	mov	bx, 0080h
	div	bx		; �õ����,eax / 128 = y ... z, ��ʾeax����FAT��ĵ�y�������ĵ�z������
				; y ---> ax, z ---> dx
	push	dx
	add	ax, FATStart	; �õ���Ӧ����������
	mov	cl, 1		; ��ȡһ������
	mov	bx, 0
	call	ReadSector
	pop	dx		; ȡ��dx, FAT�������е�ƫ����
	mov	ax, dx
	mov	cl, 04h
	mul	cl		; ����洢��ax��
	add	bx, ax	
	mov	eax, dword [es:bx]
	
	pop	ebx
	pop 	es
	ret


;*************************************************************************************************************
; ReadSector
; �ӵ�ax��Sector��ַ����ȡcx��Sector���ڴ��es:bx��
;*************************************************************************************************************
ReadSector:
	; ��ͷ��: NumberOfTrackHead	= 0x10 = 0001 0000 = 16
	; ÿ�ŵ�������: SectorsPerTrack	= 0x3f = 0011 1111 = 63
	; ������: NumberOfCylinder	= 0x65 = 0110 0101 = 101
	; �����/�ŵ��� --> ch, ��ͷ�� --> dh, ��ʼ������ --> cl, �������� --> dl
	; ������Ϊax�е�ֵ, ��ȡ��������Ϊcx�е�ֵ
	;
	;	x		�� �� y	  =>  ����� y >> 6, ��ͷ�� y & 3f
	;------------------ =>  ��
	;   ÿ�ŵ�������	�� ���� z => ��ʼ������ = z + 1
	push	cx
	push	bx
	push	es

	mov	bl, 0x3f		; ÿ�ŵ�������, ����
	div	bl			; ��y --> al, ����z --> ah
	inc 	ah
	mov	cl, ah			; ��ʼ������ --> cl
	mov	ch, al	
	shr	ch, 4			; �ŵ��� --> ch
	mov	dh, al	
	and	dh, 0x0f		; ��ͷ�� --> dh
	mov	dl, 0x80
	pop	es
	pop	bx

.Reading:
	pop	ax
	mov	ah, 2
	int	13h
	jc	.Reading

	ret

;*************************************************************************************************************
; ������: DispStrRealMode
; ����: ��ʾһ���ַ���, ������ʼʱ,dhӦ�����ַ��������(��0��ʼ), dl��ʾ����ڵڼ���
; p.s. ��Ҫ������ַ�������ͬһλ�ö���
;*************************************************************************************************************
DispStrRealMode:
	mov	ax, MessageLength
	mul	dh
	add	ax, LoadingMessage
	mov	bp, ax
	mov	ax, ds
	mov	es, ax					; es:bp ����ַ
	mov	cx, MessageLength			; ������
	shl	dx, 8					; ��ʼ����
	mov	ax, 0x1301				; AH = Dh, AL = 01h
	mov	bx, 0007h				; ҳ��Ϊ0(BH = 0) �ڵװ���(BL = 07h)
	int	10h
	ret

[SECTION .s32]	; 32λ�����, ��ʵģʽ����
ALIGN	32
[BITS 	32]

LABEL_PM_START:
	mov	ax, SelectorVideo
	mov	gs, ax
	mov	ax, SelectorFlatRW
	mov	ds, ax
	mov	es, ax
	mov	fs, ax
	mov	ss, ax
	mov	esp, TopOfStack

	mov	ah, 0Fh
	mov	al, 'P'
	mov	[gs:((80 * 0 + 39) * 2)], ax

	call	InitKernel
	; ��ʽ�����ں�
	jmp	SelectorFlatC:KernelEntryPointPhyAddr
	jmp	SelectorFlatC:BaseOfKernel

;	jmp	$

InitKernel:
	xor	esi, esi
	; ecx <- [pELFHdr -> e_phnum], ��ELF Header�еõ�Program Header�ĸ���
	mov	cx, word [BaseOfKernelPhyAddr + 2Ch]
	movzx	ecx, cx
	; esi <- [pELFHdr -> p_phoff], ��ELF Header�еõ�Program header table���ļ��е�ƫ����
	mov	esi, [BaseOfKernelPhyAddr + 1Ch]
	; esi <- [OffsetOfKernel + pELFHdr -> e_phoff], �õ�Program header table���ڴ��е�ƫ����
	add	esi, BaseOfKernelPhyAddr
.Begin:
	mov	eax, [esi + 0]
	cmp	eax, 0			; PT_NULL
	jz	.NoAction
	; MemCpy((void *)(pPHdr -> p_vaddr), uchCode + pPHdr -> p_offset, pPHdr -> p_filesz);
	push	dword [esi + 010h]	; size
	mov	eax, [esi + 04h]
	add	eax, BaseOfKernelPhyAddr
	push	eax			; src
	push	dword [esi + 08h]	; dst
	call	MemCpy			;
	add	esp, 12

.NoAction:
	add 	esi, 020h
	dec	ecx
	jnz	.Begin

	ret

; ------------------------------------------------------------------------
; ��ʾ AL �е�����
; ------------------------------------------------------------------------
DispAL:
	push	ecx
	push	edx
	push	edi

	mov	edi, [dwDispPos]

	mov	ah, 0Fh			; 0000b: �ڵ�    1111b: ����
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

	mov	[dwDispPos], edi

	pop	edi
	pop	edx
	pop	ecx

	ret
; DispAL ����-------------------------------------------------------------


; ------------------------------------------------------------------------
; ��ʾһ��������
; ------------------------------------------------------------------------
DispInt:
	mov	eax, [esp + 4]
	shr	eax, 24
	call	DispAL

	mov	eax, [esp + 4]
	shr	eax, 16
	call	DispAL

	mov	eax, [esp + 4]
	shr	eax, 8
	call	DispAL

	mov	eax, [esp + 4]
	call	DispAL

	mov	ah, 07h			; 0000b: �ڵ�    0111b: ����
	mov	al, 'h'
	push	edi
	mov	edi, [dwDispPos]
	mov	[gs:edi], ax
	add	edi, 4
	mov	[dwDispPos], edi
	pop	edi

	ret
; DispInt ����------------------------------------------------------------

; ------------------------------------------------------------------------
; ��ʾһ���ַ���
; ------------------------------------------------------------------------
DispStr:
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi

	mov	esi, [ebp + 8]	; pszInfo
	mov	edi, [dwDispPos]
	mov	ah, 0Fh
.1:
	lodsb
	test	al, al
	jz	.2
	cmp	al, 0Ah	; �ǻس���?
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
	mov	[gs:edi], ax
	add	edi, 2
	jmp	.1

.2:
	mov	[dwDispPos], edi

	pop	edi
	pop	esi
	pop	ebx
	pop	ebp
	ret
; DispStr ����------------------------------------------------------------

; ------------------------------------------------------------------------
; ����
; ------------------------------------------------------------------------
DispReturn:
	push	szReturn
	call	DispStr			;printf("\n");
	add	esp, 4

	ret
; DispReturn ����---------------------------------------------------------

;*************************************************************************************************************
; MemCpy(p_vaddr, BaseOfLoaderPhyAddr + p_offset, p_filesz);
; �����ں˵�Program header table����Ϣ��������MemCpy()���ڴ渴��
; p_vaddr: �����ڴ��е������ַ
; p_offset: �����ļ��е�ƫ��
; p_filesz: �����ļ��еĵ�ַ
;*************************************************************************************************************
; ------------------------------------------------------------------------
; �ڴ濽������ memcpy
; ------------------------------------------------------------------------
; void* MemCpy(void* es:pDest, void* ds:pSrc, int iSize);
; ------------------------------------------------------------------------
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
; MemCpy ����-------------------------------------------------------------

[SECTION .data1]
ALIGN	32
LABEL_DATA:
; ʵģʽ��ʹ����Щ����
; �ַ���
_szMemChkTitle:			db	"BaseAddrL BaseAddrH LengthLow LengthHigh   Type", 0Ah, 0
_szRAMSize:			db	"RAM size:", 0
_szReturn:			db	0Ah, 0
;; ����
_dwMCRNumber:			dd	0	; Memory Check Result
_dwDispPos:			dd	(80 * 6 + 0) * 2	; ��Ļ�� 6 ��, �� 0 �С�
_dwMemSize:			dd	0
_ARDStruct:			; Address Range Descriptor Structure
	_dwBaseAddrLow:		dd	0
	_dwBaseAddrHigh:	dd	0
	_dwLengthLow:		dd	0
	_dwLengthHigh:		dd	0
	_dwType:		dd	0
_MemChkBuf:	times	256	db	0
;
;; ����ģʽ��ʹ����Щ����
szMemChkTitle		equ	BaseOfLoaderPhyAddr + _szMemChkTitle
szRAMSize		equ	BaseOfLoaderPhyAddr + _szRAMSize
szReturn		equ	BaseOfLoaderPhyAddr + _szReturn
dwDispPos		equ	BaseOfLoaderPhyAddr + _dwDispPos
dwMemSize		equ	BaseOfLoaderPhyAddr + _dwMemSize
dwMCRNumber		equ	BaseOfLoaderPhyAddr + _dwMCRNumber
ARDStruct		equ	BaseOfLoaderPhyAddr + _ARDStruct
	dwBaseAddrLow	equ	BaseOfLoaderPhyAddr + _dwBaseAddrLow
	dwBaseAddrHigh	equ	BaseOfLoaderPhyAddr + _dwBaseAddrHigh
	dwLengthLow	equ	BaseOfLoaderPhyAddr + _dwLengthLow
	dwLengthHigh	equ	BaseOfLoaderPhyAddr + _dwLengthHigh
	dwType		equ	BaseOfLoaderPhyAddr + _dwType
MemChkBuf		equ	BaseOfLoaderPhyAddr + _MemChkBuf

; ��ջ�����ݶε�ĩβ
StackSpace:	times	1024	db	0
TopOfStack	equ	BaseOfLoaderPhyAddr	+ $	; ջ��
