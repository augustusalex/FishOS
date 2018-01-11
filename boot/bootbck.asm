;%define	_BOOT_DEBUG_

%ifdef	_BOOT_DEBUG_
	org	0100h					; 调试状态
%else
	org	07c00h					; boot状态, BIOS将BootSector加载到0:7c00处执行
%endif

jmp	START

	; 文件系统的描述信息
	OEM_ID			db	"FishOS  "	; OEM(原始设备制造商)代号, 必须占满8字节
	BytesPerSector		dw	0x0200		; 每扇区字节数
	SectorsPerCluster	db	0x01		; 每簇扇区数
	ReservedSectors		dw	0x0026		; 保留扇区数
	NumberOfFAT		db	0x02		; FAT表个数
	FlagOfFileSystem	dw	0x0000		; 标注文件系统为FAT32
	Kept1			dw	0x0000		; 保留字段
	MediaDescriptor		db	0xF8		; 磁盘介质描述符, 硬盘为F8
	Kept2			dw	0x0000		; 保留字段
	SectorsPerTrack		dw 	0x0020		; 每磁道扇区数
	NumberOfTrackHead	dw	0x0040		; 磁头数
	HiddenSectors		dd	0x00000000	; 分区前隐藏分区的个数
	TotalOfSectors		dd	0x00028000	; 逻辑磁盘中的扇区总数
	SectorsPerFAT		dd	0x000004ED	; 每个FAT表的扇区数
	MirrorOfFAT		dw	0x0000		; FAT表镜像标志, 0表示有两份FAT表, 互为备份; 1表示仅1份
	FSVersion		dw	0x0000		; 文件系统的主次版本(保留)
	RootDirectoryStart	dd	0x00000002	; 根目录的起始扇区号
	FSInfoSector		dw	0x0001		; 文件系统信息扇区号
	BackOfDBR		dw	0x0006		; DBR备份扇区号

	TIMES	12	DB	0			; 保留字段, 12个字节
;	PhysicalDriveNumber	dw	0x80		; 用于INT 0x13的驱动器号
	PhysicalDriveNumber	db	0xc0		; BIOS驱动器号
	Kept3			db	0x8e		; 保留
;	Signature		db	0x29		; 磁盘读写参数扩展标志
	Signature		db	0xd0		; 磁盘读写参数扩展标志
;	VolumeID		dd	0x5b2e2fa0	; 卷序列号
	VolumeID		dd	0xb87c00bc	; 卷序列号
	VolumeLabel		db	"FishOS  FAT"	; 磁盘卷标号, 必须为11字节
	FSType			db	"FAT32   "	; 文件系统标识号

%ifdef	_BOOT_DEBUG_
	BaseOfStack		equ	0100h		; 调试状态下堆栈基地址(栈底, 从这个位置向低地址生长)
%else
	BaseOfStack		equ	07c00h		; Boot状态下堆栈基地址(栈底, 从这个位置向低地址生长)
%endif
	BaseOfLoader		equ	09000h		; 将Loader.bin加载到的位置 -- 段基址
	OffsetOfLoader		equ	0100h		; 将Loader.bin加载到的位置 -- 偏移地址
	DeltaSectorNo		equ	9FEh		

; 引导程序的入口
START:
	cli
	; 初始化堆栈
	mov	ax, cs
	mov	ds, ax
	mov	es, ax
	mov	ss, ax
	mov	fs, ax
	mov	gs, ax
	mov	sp, BaseOfStack
	sti

	; 清屏
	mov	ax, 0600h				; ah = 6, al = 0
	mov	bx, 0700h				; 黑底白字(bh = 07h)
	mov	cx, 0					; 左上角: (0, 0)
	mov	dx, 0184fh				; 右下角: (80, 50)
	int 	10h					; 调用10号中断
	
	xor	ah, ah					; 磁盘系统复位
	xor	dl, dl					; dl = 0x80, 代表是硬盘
	mov	dl, 0x80
	int	13h					

; 下面读取扇区
	mov	ax, BaseOfLoader
	mov	es, ax
	mov	bx, OffsetOfLoader			; es:bx <--- Loader.bin被加载到的位置
	call	ReadSector				; 读取一个扇区

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


; 字符串定义区域, 需要输出的字符串在此处定义
MessageLength	equ	9				; 定义每个字符串的长度为11字节, 
BootMessage	db	"Booting  "	
ReadSuccess	db	"Read Succ"	
ReadFail	db	"Read Fail"
WriteSuccess	db	"WriteSucc"
WriteFail	db	"WriteFail"
LoaderFileName	db	"LOADER  BIN", 0

;*************************************************************************************************************
; ReadSector
; 从第ax个Sector地址处读取cx个Sector到内存的es:bx处
;*************************************************************************************************************
ReadSector:
	push	bp
	mov	bp, sp
	sub	esp, 2

	xor	ax, ax
	mov	ax, BaseOfLoader
	mov	es, ax
	mov 	bx, OffsetOfLoader
	mov	ch, 00h			; 磁道号/柱面号
	mov	dh, 00h			; 磁头号
	mov	cl, 21h			; 起始扇区号
	mov	dl, 0x80		; 驱动器号

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
; 在第ax个扇区处写入es:bx地址处的cx个扇区的内容
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
	mov	ch, 00h			; 磁道号/柱面号
	mov	dh, 01h			; 磁头号
	mov	cl, 01h			; 起始扇区号
	xor	dl, dl			; 驱动器号
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
; 函数名: DispStr
; 作用: 显示一个字符串, 函数开始时,dh应该是字符串的序号(从0开始)
; p.s. 需要输出的字符串均在同一位置定义
;*************************************************************************************************************
DispStr:
	mov	ax, MessageLength
	mul	dh
	add	ax, BootMessage
	mov	bp, ax
	mov	ax, ds
	mov	es, ax					; es:bp 串地址
	mov	cx, MessageLength			; 串长度
	mov	dx, 0x0000				; 起始行列
	mov	ax, 0x1301				; AH = Dh, AL = 01h
	mov	bx, 0007h				; 页号为0(BH = 0) 黑底白字(BL = 07h)
	int	10h
	ret

times	510-($-$$)	db	0			; 用0填充剩下的空间
dw	0xaa55