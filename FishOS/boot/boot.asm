;%define	_BOOT_DEBUG_

%ifdef	_BOOT_DEBUG_
	org	0100h					; ����״̬
%else
	org	07c00h					; boot״̬, BIOS��BootSector���ص�0:7c00��ִ��
%endif

;org	0100h	; ����״̬
jmp	START

	%include "FAT32Head.inc"

%ifdef	_BOOT_DEBUG_
	BaseOfStack		equ	0100h		; ����״̬�¶�ջ����ַ(ջ��, �����λ����͵�ַ����)
%else
	BaseOfStack		equ	07c00h		; Boot״̬�¶�ջ����ַ(ջ��, �����λ����͵�ַ����)
%endif
	BaseOfLoader		equ	09000h		; ��Loader.bin���ص���λ�� -- �λ�ַ
	OffsetOfLoader		equ	0100h		; ��Loader.bin���ص���λ�� -- ƫ�Ƶ�ַ

; ������������
START:
	cli
	; ��ʼ����ջ
	mov	ax, cs
	mov	ds, ax
	mov	es, ax
	mov	ss, ax
	mov	fs, ax
	mov	gs, ax
	mov	sp, BaseOfStack
	sti

	; ����
	mov	ax, 0600h				; ah = 6, al = 0
	mov	bx, 0700h				; �ڵװ���(bh = 07h)
	mov	cx, 0					; ���Ͻ�: (0, 0)
	mov	dx, 0184fh				; ���½�: (80, 50)
	int 	10h					; ����10���ж�

	mov	dx, 0000h
	call	DispStr
	
	xor	ah, ah					; ����ϵͳ��λ
	mov	dl, 0x80				; dl = 0x80, ������Ӳ��
	int	13h					

; ���濪ʼѰ��Loader.bin
; ���Ƚ���Ŀ¼��������������, FAT32�ļ�ϵͳ�в��ø����ĸ�Ŀ¼��, ��˹̶��ĸ�Ŀ¼��ֻ��һ��
; ���Բ���Ҫ���ܶ�����, ֻ���һ����������
	mov	ax, BaseOfLoader			; Loader.bin�����ص���λ��
	mov	es, ax
	mov	bx, OffsetOfLoader
	mov	ax, 0x063e				; �ӵ�ax��������ʼ��ȡcl��������es:bxָ�����ڴ滺������
	mov	cl, 1					; ��ȡһ������
	call	ReadSector

	mov	si, LoaderFileName			; ds:si ---> "LOADER  BIN"
	mov	di, OffsetOfLoader			; es:di ---> BaseOfLoader:OffsetOfLoader
	cld
	mov	dx, 10h
.FindLoader:
	cmp	dx, 0h
	jz	.FindFail				; 0��־Ϊ1��ת, 0��־Ϊ1, �������
	dec	dx					; ѭ�����Ʊ���-1
	mov	cx, 11					; ����ѭ������, �ļ�������Ϊ11B
; �Ƚ��ļ����Ƿ�ƥ��
.CMPFilename:
	cmp	cx, 0
	jz	.FindSuccess				; 11���ֽڶ���ͬ��ʾ�ҵ�
	dec	cx
	lodsb						; ds:si ---> al
	mov	ah, byte [es:di]
	cmp	ah, al
	jz	.GoOn

	; ƥ��ʧ��, ������һ��Ŀ¼��
	; ���Ȼָ�si�Ĵ�����ֵ, Ȼ��di�Ĵ�����ֵָ����һ��Ŀ¼�����ʼλ��
	mov	si, LoaderFileName			; lodsb��ÿ��ȡһ���ֽ�, si�ݼ�
	and	di, 0FFE0h
	add	di, 20h
	jmp	.FindLoader

.GoOn:
	inc	di
	jmp	.CMPFilename

.FindFail:
	mov	dx, 0101h
	call	DispStr
%ifdef	_BOOT_DEBUG_					; û���ҵ�Loader.bin, ����DOS
	mov	ax, 4c00h
	int	21h
%else
	jmp	$					; û���ҵ�Loader.bin, ��ѭ��
%endif

.FindSuccess:						; �ҵ�Loader.bin��Ŀ¼��, ����������һ���
	mov	dx, 0202h
	call	DispStr
	push	ax
	mov	ax, BaseOfLoader
	mov	es, ax
	pop	ax
	and	di, 0FFE0h
	add	di, 14h
	mov	ax, word [es:di]
	shl	eax, 16
	add	di, 6h
	mov	ax, word [es:di]			; �˴�, eax�м�¼�ı���Loader.bin�ļ��ĵ�һ���, Ҳ��FAT�е����
	push	eax
	add	ax, SectorsOfDict
	sub	eax, 2					; �õ�Loader.binռ�õĵ�һ������������������
	push	eax
	mov	ax, BaseOfLoader
	mov	es, ax					; BaseOfLoader ---> es
	mov	bx, OffsetOfLoader			; OffsetOfLoader ---> bx, es:bxָ����Ҫ��Loader.binд���λ��
	pop	eax					; Loader.bin�������� ---> eax
; �ɹ��ҵ�Loader.bin��Ŀ¼��֮��, �ҵ�����ʼ���, Ȼ�����õ�Loader.bin�ĵ�һ��������

.LoadingFile:
	push	eax
	push	ebx
	mov	ah, 0Eh
	mov	al, '.'
	mov	bl, 0Fh
	int	10h			; ÿ��ȡһ������, ���һ��'.'
	pop	ebx
	pop	eax

	mov	cl, 1
	call	ReadSector

	pop	eax			; ȡ��Loader.bin�ļ���FAT���е����
	call	GetFATEntry		; ��ȡ��һ���߼����
	cmp	eax, 0FFFFFF8h		; �ж��Ƿ������һ����, �����ڵ���0FFFFFF8hʱ, ��ʾ�˿�Ϊ���һ��
	jc	.LoadContinue

	jmp	BaseOfLoader:OffsetOfLoader

.LoadContinue:
	push	eax			; eax�д����һ���߼�������
	add	eax, SectorsOfDict	
	sub	eax, 2			; �õ���һ������������������
	add	bx, [BytesPerSector]
	jmp	.LoadingFile


; �ַ�����������, ��Ҫ������ַ����ڴ˴�����
MessageLength	equ	9				; ����ÿ���ַ����ĳ���Ϊ11�ֽ�, 
BootMessage	db	"Booting  "	
FindFail	db	"Find Fail"
FindSuccess	db	"Find Succ"
LoadSucc	db	"Load Succ"
LoadFail	db	"Load Fail"
LoaderFileName	db	"LOADER  BIN", 0

;*************************************************************************************************************
; GetFATEntry
; ��ȡFAT���е�eax��FAT�����е�ֵ
;*************************************************************************************************************
GetFATEntry:
	push	es
	push	ebx
	push	eax

	mov	ax, BaseOfLoader
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
; ������: DispStr
; ����: ��ʾһ���ַ���, ������ʼʱ,dhӦ�����ַ��������(��0��ʼ), dl��ʾ����ڵڼ���
; p.s. ��Ҫ������ַ�������ͬһλ�ö���
;*************************************************************************************************************
DispStr:
	mov	ax, MessageLength
	mul	dh
	add	ax, BootMessage
	mov	bp, ax
	mov	ax, ds
	mov	es, ax					; es:bp ����ַ
	mov	cx, MessageLength			; ������
	shl	dx, 8					; ��ʼ����
	mov	ax, 0x1301				; AH = Dh, AL = 01h
	mov	bx, 0007h				; ҳ��Ϊ0(BH = 0) �ڵװ���(BL = 07h)
	int	10h
	ret

times	510-($-$$)	db	0			; ��0���ʣ�µĿռ�
dw	0xaa55




;1. ���������Ĵ��룬��boot������ͨ�����ҵ�boot�滻�����boot
;2. ���ף��⼸���ű�makefile��sh��c �������˼
;3. �ѳ����Ż�һ�£�Ȼ��load.bin �����Լ��ģ�boot��loader������ģ���kernel
;4. ����kernel֮�󡣡��� ���һ��һ������
