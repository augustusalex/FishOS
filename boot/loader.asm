org	0100h

BaseOfStack			equ	0100h
BaseOfKernel		equ	08000h			; Kernel.bin被加载到的位置 --->   段基址
OffsetOfKernel		equ	0h			; Kernel.bin被加载到的位置 ---> 偏移地址
BaseOfKernelPhyAddr	equ	BaseOfKernel	* 10h	; Kernel.bin被加载到的位置, 物理地址

BaseOfLoader		equ	09000h			; Loader.bin被加载到的位置 --->	  段基址
OffsetOfLoader		equ	0100h			; Loader.bin被加载到的位置 ---> 偏移地址
BaseOfLoaderPhyAddr	equ	BaseOfLoader	* 10h	; Loader.bin被加载到的位置, 物理地址

KernelEntryPointPhyAddr	equ 	030400h

jmp	LABEL_START

%include "pm.inc"
%include "FAT32Head.inc"

LABEL_GDT:		Descriptor	0,	 0,		0				; 空描述符
LABEL_DESC_FLAT_C:	Descriptor	0,	 0fffffh,	DA_CR | DA_32  | DA_LIMIT_4K	; 0 ~ 4G的可执行段
LABEL_DESC_FLAT_RW:	Descriptor	0, 	 0fffffh,	DA_DRW| DA_32  | DA_LIMIT_4K	; 0 ~ 4G的可读写段
LABEL_DESC_VIDEO:	Descriptor	0B8000h, 0ffffh,	DA_DRW| DA_DPL3		; 指向显存的段

GdtLen		equ	$ - LABEL_GDT
GdtPtr		dw	GdtLen - 1				; 段界限
		dd	BaseOfLoaderPhyAddr + LABEL_GDT	; 基地址

; 选择子
SelectorFlatC		equ	LABEL_DESC_FLAT_C	- LABEL_GDT
SelectorFlatRW		equ	LABEL_DESC_FLAT_RW	- LABEL_GDT
SelectorVideo		equ	LABEL_DESC_VIDEO	- LABEL_GDT + SA_RPL3

LABEL_START:
	mov	ax, cs
	mov	ds, ax
	mov	es, ax
	mov	ss, ax
	mov	sp, BaseOfStack

	; 清屏
	mov	ax, 0600h
	mov	bx, 0700h
	mov	cx, 0
	mov	dx, 0184fh
	int	10h
	
	;在根目录下寻找Kernel.bin文件, 并加载进入内存
	mov	dx, 0000h		; 在第0行输出"Loading.."字符串
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
; 比较文件名是否匹配
.CMPFileName:
	cmp	cx, 0
	jz	.FindSuccess
	dec	cx
	lodsb
	mov	ah, byte [es:di]
	cmp	ah, al
	jz	.GoOn

	; 匹配失败, 查找下一个目录项
	; 首先回复si寄存器的值, 然后将di寄存器的值指向下一个目录项的起始位置
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
	pop	eax			; Kernel.bin的扇区号	---> eax

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


	pop	eax			; 取出Kernel.bin文件在FAT表中的序号
	call	GetFATEntry		; 获取下一个逻辑块号
	cmp	eax, 0FFFFFF8h		; 判断是否是最后一个块, 当大于等于0FFFFFF8h时, 表示此块为最后一块
	jc	.LoadContinue

	call	KillMotor
	mov	dx, 0303h
	call	DispStrRealMode

	; 下面准备跳入保护模式
	; 加载gdtr
	lgdt	[GdtPtr]
	; 关中断
	cli
	; 打开A20地址线
	in	al, 92h
	or	al, 00000010b
	out	92h, al

	mov	eax, cr0
	or	eax, 1
	mov	cr0, eax

;	jmp 	$

	; 真正进入保护模式
	jmp	dword	SelectorFlatC:(BaseOfLoaderPhyAddr + LABEL_PM_START)

.LoadContinue:
	push	eax			; eax中存放下一个逻辑扇区号
	add	eax, SectorsOfDict	
	sub	eax, 2			; 得到下一个扇区的物理扇区号
	add	bx, [BytesPerSector]
	jmp	.LoadingFile

MessageLength	equ	9		; 定义每个字符串的长度为11字节
LoadingMessage	db	"Loading.."
NoKernel	db	"No Kernel"
KernelFound	db	"Kernel OK"
Ready		db	"Ready...."
KernelFileName	db	"KERNEL  BIN"

;*************************************************************************************************************
; KillMotor
; 功能: 关闭软驱马达, 否则软驱的灯会常亮
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
; 获取FAT表中第eax项FAT表项中的值
;*************************************************************************************************************
GetFATEntry:
	push	es
	push	ebx
	push	eax

	mov	ax, BaseOfKernel
	sub	ax, 1000h		; 在BaseOfLoader之前预留4KB存放FAT表的扇区
	mov	es, ax

	; eax中记录Loader.bin第一个扇区的逻辑块号, 也对应着FAT表中相对应的表项
	; 首先求得此表项属于FAT表中的第几个扇区
	; 一个FAT表项为4B, 一个扇区为512B, 所以一个扇区有128个表项
	pop	eax
	mov	ecx, eax
	shr	eax, 16		; 获得被除数高16位, 置于dx中
	mov	dx, ax
	xor	eax, eax
	mov	ax, cx		; 获取被除数低16位, 置于ax中
	mov	bx, 0080h
	div	bx		; 得到结果,eax / 128 = y ... z, 表示eax属于FAT表的第y个扇区的第z个表项
				; y ---> ax, z ---> dx
	push	dx
	add	ax, FATStart	; 得到对应物理扇区号
	mov	cl, 1		; 读取一个扇区
	mov	bx, 0
	call	ReadSector
	pop	dx		; 取出dx, FAT表扇区中的偏移量
	mov	ax, dx
	mov	cl, 04h
	mul	cl		; 结果存储在ax中
	add	bx, ax	
	mov	eax, dword [es:bx]
	
	pop	ebx
	pop 	es
	ret


;*************************************************************************************************************
; ReadSector
; 从第ax个Sector地址处读取cx个Sector到内存的es:bx处
;*************************************************************************************************************
ReadSector:
	; 磁头数: NumberOfTrackHead	= 0x10 = 0001 0000 = 16
	; 每磁道扇区数: SectorsPerTrack	= 0x3f = 0011 1111 = 63
	; 柱面数: NumberOfCylinder	= 0x65 = 0110 0101 = 101
	; 柱面号/磁道号 --> ch, 磁头号 --> dh, 起始扇区号 --> cl, 驱动器号 --> dl
	; 扇区号为ax中的值, 读取的扇区数为cx中的值
	;
	;	x		┌ 商 y	  =>  柱面号 y >> 6, 磁头号 y & 3f
	;------------------ =>  ┤
	;   每磁道扇区数	└ 余数 z => 起始扇区号 = z + 1
	push	cx
	push	bx
	push	es

	mov	bl, 0x3f		; 每磁道扇区数, 除数
	div	bl			; 商y --> al, 余数z --> ah
	inc 	ah
	mov	cl, ah			; 起始扇区号 --> cl
	mov	ch, al	
	shr	ch, 4			; 磁道号 --> ch
	mov	dh, al	
	and	dh, 0x0f		; 磁头号 --> dh
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
; 函数名: DispStrRealMode
; 作用: 显示一个字符串, 函数开始时,dh应该是字符串的序号(从0开始), dl表示输出在第几行
; p.s. 需要输出的字符串均在同一位置定义
;*************************************************************************************************************
DispStrRealMode:
	mov	ax, MessageLength
	mul	dh
	add	ax, LoadingMessage
	mov	bp, ax
	mov	ax, ds
	mov	es, ax					; es:bp 串地址
	mov	cx, MessageLength			; 串长度
	shl	dx, 8					; 起始行列
	mov	ax, 0x1301				; AH = Dh, AL = 01h
	mov	bx, 0007h				; 页号为0(BH = 0) 黑底白字(BL = 07h)
	int	10h
	ret

[SECTION .s32]	; 32位代码段, 由实模式跳入
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
	; 正式进入内核
	jmp	SelectorFlatC:KernelEntryPointPhyAddr
	jmp	SelectorFlatC:BaseOfKernel

;	jmp	$

InitKernel:
	xor	esi, esi
	; ecx <- [pELFHdr -> e_phnum], 从ELF Header中得到Program Header的个数
	mov	cx, word [BaseOfKernelPhyAddr + 2Ch]
	movzx	ecx, cx
	; esi <- [pELFHdr -> p_phoff], 从ELF Header中得到Program header table在文件中的偏移量
	mov	esi, [BaseOfKernelPhyAddr + 1Ch]
	; esi <- [OffsetOfKernel + pELFHdr -> e_phoff], 得到Program header table在内存中的偏移量
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
; 显示 AL 中的数字
; ------------------------------------------------------------------------
DispAL:
	push	ecx
	push	edx
	push	edi

	mov	edi, [dwDispPos]

	mov	ah, 0Fh			; 0000b: 黑底    1111b: 白字
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
; DispAL 结束-------------------------------------------------------------


; ------------------------------------------------------------------------
; 显示一个整形数
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

	mov	ah, 07h			; 0000b: 黑底    0111b: 灰字
	mov	al, 'h'
	push	edi
	mov	edi, [dwDispPos]
	mov	[gs:edi], ax
	add	edi, 4
	mov	[dwDispPos], edi
	pop	edi

	ret
; DispInt 结束------------------------------------------------------------

; ------------------------------------------------------------------------
; 显示一个字符串
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
; DispStr 结束------------------------------------------------------------

; ------------------------------------------------------------------------
; 换行
; ------------------------------------------------------------------------
DispReturn:
	push	szReturn
	call	DispStr			;printf("\n");
	add	esp, 4

	ret
; DispReturn 结束---------------------------------------------------------

;*************************************************************************************************************
; MemCpy(p_vaddr, BaseOfLoaderPhyAddr + p_offset, p_filesz);
; 依据内核的Program header table的信息进行类似MemCpy()的内存复制
; p_vaddr: 段在内存中的虚拟地址
; p_offset: 段在文件中的偏移
; p_filesz: 段在文件中的地址
;*************************************************************************************************************
; ------------------------------------------------------------------------
; 内存拷贝，仿 memcpy
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
; MemCpy 结束-------------------------------------------------------------

[SECTION .data1]
ALIGN	32
LABEL_DATA:
; 实模式下使用这些符号
; 字符串
_szMemChkTitle:			db	"BaseAddrL BaseAddrH LengthLow LengthHigh   Type", 0Ah, 0
_szRAMSize:			db	"RAM size:", 0
_szReturn:			db	0Ah, 0
;; 变量
_dwMCRNumber:			dd	0	; Memory Check Result
_dwDispPos:			dd	(80 * 6 + 0) * 2	; 屏幕第 6 行, 第 0 列。
_dwMemSize:			dd	0
_ARDStruct:			; Address Range Descriptor Structure
	_dwBaseAddrLow:		dd	0
	_dwBaseAddrHigh:	dd	0
	_dwLengthLow:		dd	0
	_dwLengthHigh:		dd	0
	_dwType:		dd	0
_MemChkBuf:	times	256	db	0
;
;; 保护模式下使用这些符号
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

; 堆栈在数据段的末尾
StackSpace:	times	1024	db	0
TopOfStack	equ	BaseOfLoaderPhyAddr	+ $	; 栈顶
