;%define	_BOOT_DEBUG_

%ifdef	_BOOT_DEBUG_
	org	0100h					; ����״̬
%else
	org	07c00h					; boot״̬, BIOS��BootSector���ص�0:7c00��ִ��
%endif

jmp	START

	; �ļ�ϵͳ��������Ϣ
	OEM_ID			db	"FishOS  "	; OEM(ԭʼ�豸������)����, ����ռ��8�ֽ�
	BytesPerSector		dw	0x0200		; ÿ�����ֽ���
	SectorsPerCluster	db	0x01		; ÿ��������
	ReservedSectors		dw	0x0026		; ����������
	NumberOfFAT		db	0x02		; FAT�����
	FlagOfFileSystem	dw	0x0000		; ��ע�ļ�ϵͳΪFAT32
	Kept1			dw	0x0000		; �����ֶ�
	MediaDescriptor		db	0xF8		; ���̽���������, Ӳ��ΪF8
	Kept2			dw	0x0000		; �����ֶ�
	SectorsPerTrack		dw 	0x0020		; ÿ�ŵ�������
	NumberOfTrackHead	dw	0x0040		; ��ͷ��
	HiddenSectors		dd	0x00000000	; ����ǰ���ط����ĸ���
	TotalOfSectors		dd	0x00028000	; �߼������е���������
	SectorsPerFAT		dd	0x000004ED	; ÿ��FAT���������
	MirrorOfFAT		dw	0x0000		; FAT�����־, 0��ʾ������FAT��, ��Ϊ����; 1��ʾ��1��
	FSVersion		dw	0x0000		; �ļ�ϵͳ�����ΰ汾(����)
	RootDirectoryStart	dd	0x00000002	; ��Ŀ¼����ʼ������
	FSInfoSector		dw	0x0001		; �ļ�ϵͳ��Ϣ������
	BackOfDBR		dw	0x0006		; DBR����������

	TIMES	12	DB	0			; �����ֶ�, 12���ֽ�
;	PhysicalDriveNumber	dw	0x80		; ����INT 0x13����������
	PhysicalDriveNumber	db	0xc0		; BIOS��������
	Kept3			db	0x8e		; ����
;	Signature		db	0x29		; ���̶�д������չ��־
	Signature		db	0xd0		; ���̶�д������չ��־
;	VolumeID		dd	0x5b2e2fa0	; �����к�
	VolumeID		dd	0xb87c00bc	; �����к�
	VolumeLabel		db	"FishOS  FAT"	; ���̾���, ����Ϊ11�ֽ�
	FSType			db	"FAT32   "	; �ļ�ϵͳ��ʶ��

%ifdef	_BOOT_DEBUG_
	BaseOfStack		equ	0100h		; ����״̬�¶�ջ����ַ(ջ��, �����λ����͵�ַ����)
%else
	BaseOfStack		equ	07c00h		; Boot״̬�¶�ջ����ַ(ջ��, �����λ����͵�ַ����)
%endif
	BaseOfLoader		equ	09000h		; ��Loader.bin���ص���λ�� -- �λ�ַ
	OffsetOfLoader		equ	0100h		; ��Loader.bin���ص���λ�� -- ƫ�Ƶ�ַ
	DeltaSectorNo		equ	9FEh		

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
	
	xor	ah, ah					; ����ϵͳ��λ
	xor	dl, dl					; dl = 0x80, ������Ӳ��
	mov	dl, 0x80
	int	13h					

; �����ȡ����
	mov	ax, BaseOfLoader
	mov	es, ax
	mov	bx, OffsetOfLoader			; es:bx <--- Loader.bin�����ص���λ��
	call	ReadSector				; ��ȡһ������

	mov	ax, BaseOfLoader
	mov	es, ax
	mov	bp, OffsetOfLoader
	mov	cx, 0x0200
	mov	ax, 01301h
	mov	bx, 0007h
	mov	dx, 0x0101
	int	10h

;;	call	WriteSector

	jmp	$


; �ַ�����������, ��Ҫ������ַ����ڴ˴�����
MessageLength	equ	9				; ����ÿ���ַ����ĳ���Ϊ11�ֽ�, 
BootMessage	db	"Booting  "	
ReadSuccess	db	"Read Succ"	
ReadFail	db	"Read Fail"
WriteSuccess	db	"WriteSucc"
WriteFail	db	"WriteFail"
LoaderFileName	db	"LOADER  BIN", 0

;*************************************************************************************************************
; ReadSector
; �ӵ�ax��Sector��ַ����ȡcx��Sector���ڴ��es:bx��
;*************************************************************************************************************
ReadSector:
	push	bp
	mov	bp, sp
	sub	esp, 2

	xor	ax, ax
	mov	ax, BaseOfLoader
	mov	es, ax
	mov 	bx, OffsetOfLoader
	mov	ch, 00h			; �ŵ���/�����
	mov	dh, 00h			; ��ͷ��
	mov	cl, 21h			; ��ʼ������
	mov	dl, 0x80		; ��������

.Reading:
	mov	ah, 0x02
	mov	al, 0x01
	int	13h
	jc	.Fail

	mov	dh, 1
	call	DispStr
	add	esp, 2
	pop	bp
	ret

.Fail:
	mov	dh, 2
	Call 	DispStr
	jmp	.Reading
;*************************************************************************************************************
; WriteSector
; �ڵ�ax��������д��es:bx��ַ����cx������������
;*************************************************************************************************************
WriteSector:
	push	bp
	push	ax
	push	bx
	push	cx
	push	dx

	mov	ax, BaseOfLoader
	mov	es, ax
	mov	bx, OffsetOfLoader
	mov	ah, 03h
	mov	al, 01h
	mov	ch, 00h			; �ŵ���/�����
	mov	dh, 01h			; ��ͷ��
	mov	cl, 01h			; ��ʼ������
	xor	dl, dl			; ��������
	mov	dl, 0x80
	int	13h
	jnc	.Success
	mov	dh, 4	
	Call	DispStr
	jmp	WriteSector

.Success:
	mov	dh, 3
	Call	DispStr
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	ret

;*************************************************************************************************************
; ������: DispStr
; ����: ��ʾһ���ַ���, ������ʼʱ,dhӦ�����ַ��������(��0��ʼ)
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
	mov	dx, 0x0000				; ��ʼ����
	mov	ax, 0x1301				; AH = Dh, AL = 01h
	mov	bx, 0007h				; ҳ��Ϊ0(BH = 0) �ڵװ���(BL = 07h)
	int	10h
	ret

times	510-($-$$)	db	0			; ��0���ʣ�µĿռ�
dw	0xaa55