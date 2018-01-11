;%define	_BOOT_DEBUG_

%ifdef	_BOOT_DEBUG_
	org	0100h					; 调试状态
%else
	org	07c00h					; boot状态, BIOS将BootSector加载到0:7c00处执行
%endif

;org	0100h	; 调试状态
jmp	START

	%include "FAT32Head.inc"

%ifdef	_BOOT_DEBUG_
	BaseOfStack		equ	0100h		; 调试状态下堆栈基地址(栈底, 从这个位置向低地址生长)
%else
	BaseOfStack		equ	07c00h		; Boot状态下堆栈基地址(栈底, 从这个位置向低地址生长)
%endif
	BaseOfLoader		equ	09000h		; 将Loader.bin加载到的位置 -- 段基址
	OffsetOfLoader		equ	0100h		; 将Loader.bin加载到的位置 -- 偏移地址

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

	mov	dx, 0000h
	call	DispStr
	
	xor	ah, ah					; 磁盘系统复位
	mov	dl, 0x80				; dl = 0x80, 代表是硬盘
	int	13h					

; 下面开始寻找Loader.bin
; 首先将根目录所在扇区读出来, FAT32文件系统中采用浮动的根目录区, 因此固定的根目录区只有一个
; 所以不需要读很多扇区, 只需读一个扇区即可
	mov	ax, BaseOfLoader			; Loader.bin被加载到的位置
	mov	es, ax
	mov	bx, OffsetOfLoader
	mov	ax, 0x063e				; 从第ax个扇区开始读取cl个扇区到es:bx指定的内存缓冲区中
	mov	cl, 1					; 读取一个扇区
	call	ReadSector

	mov	si, LoaderFileName			; ds:si ---> "LOADER  BIN"
	mov	di, OffsetOfLoader			; es:di ---> BaseOfLoader:OffsetOfLoader
	cld
	mov	dx, 10h
.FindLoader:
	cmp	dx, 0h
	jz	.FindFail				; 0标志为1跳转, 0标志为1, 两数相等
	dec	dx					; 循环控制变量-1
	mov	cx, 11					; 设置循环变量, 文件名长度为11B
; 比较文件名是否匹配
.CMPFilename:
	cmp	cx, 0
	jz	.FindSuccess				; 11个字节都相同表示找到
	dec	cx
	lodsb						; ds:si ---> al
	mov	ah, byte [es:di]
	cmp	ah, al
	jz	.GoOn

	; 匹配失败, 查找下一个目录项
	; 首先恢复si寄存器的值, 然后将di寄存器的值指向下一个目录项的起始位置
	mov	si, LoaderFileName			; lodsb会每读取一个字节, si递加
	and	di, 0FFE0h
	add	di, 20h
	jmp	.FindLoader

.GoOn:
	inc	di
	jmp	.CMPFilename

.FindFail:
	mov	dx, 0101h
	call	DispStr
%ifdef	_BOOT_DEBUG_					; 没有找到Loader.bin, 返回DOS
	mov	ax, 4c00h
	int	21h
%else
	jmp	$					; 没有找到Loader.bin, 死循环
%endif

.FindSuccess:						; 找到Loader.bin的目录项, 则继续找其第一块号
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
	mov	ax, word [es:di]			; 此处, eax中记录的便是Loader.bin文件的第一块号, 也是FAT中的序号
	push	eax
	add	ax, SectorsOfDict
	sub	eax, 2					; 得到Loader.bin占用的第一个扇区的物理扇区号
	push	eax
	mov	ax, BaseOfLoader
	mov	es, ax					; BaseOfLoader ---> es
	mov	bx, OffsetOfLoader			; OffsetOfLoader ---> bx, es:bx指向需要将Loader.bin写入的位置
	pop	eax					; Loader.bin的扇区号 ---> eax
; 成功找到Loader.bin的目录项之后, 找到其起始块号, 然后计算得到Loader.bin的第一个物理块号

.LoadingFile:
	push	eax
	push	ebx
	mov	ah, 0Eh
	mov	al, '.'
	mov	bl, 0Fh
	int	10h			; 每读取一个扇区, 输出一个'.'
	pop	ebx
	pop	eax

	mov	cl, 1
	call	ReadSector

	pop	eax			; 取出Loader.bin文件在FAT表中的序号
	call	GetFATEntry		; 获取下一个逻辑块号
	cmp	eax, 0FFFFFF8h		; 判断是否是最后一个块, 当大于等于0FFFFFF8h时, 表示此块为最后一块
	jc	.LoadContinue

	jmp	BaseOfLoader:OffsetOfLoader

.LoadContinue:
	push	eax			; eax中存放下一个逻辑扇区号
	add	eax, SectorsOfDict	
	sub	eax, 2			; 得到下一个扇区的物理扇区号
	add	bx, [BytesPerSector]
	jmp	.LoadingFile


; 字符串定义区域, 需要输出的字符串在此处定义
MessageLength	equ	9				; 定义每个字符串的长度为11字节, 
BootMessage	db	"Booting  "	
FindFail	db	"Find Fail"
FindSuccess	db	"Find Succ"
LoadSucc	db	"Load Succ"
LoadFail	db	"Load Fail"
LoaderFileName	db	"LOADER  BIN", 0

;*************************************************************************************************************
; GetFATEntry
; 获取FAT表中第eax项FAT表项中的值
;*************************************************************************************************************
GetFATEntry:
	push	es
	push	ebx
	push	eax

	mov	ax, BaseOfLoader
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
; 函数名: DispStr
; 作用: 显示一个字符串, 函数开始时,dh应该是字符串的序号(从0开始), dl表示输出在第几行
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
	shl	dx, 8					; 起始行列
	mov	ax, 0x1301				; AH = Dh, AL = 01h
	mov	bx, 0007h				; 页号为0(BH = 0) 黑底白字(BL = 07h)
	int	10h
	ret

times	510-($-$$)	db	0			; 用0填充剩下的空间
dw	0xaa55




;1. 不改其他的代码，将boot正常调通，把我的boot替换成你的boot
;2. 明白，这几个脚本makefile，sh，c 程序的意思
;3. 把程序优化一下，然后load.bin 用你自己的（boot和loader都是你的），kernel
;4. 进入kernel之后。。。 这个一个一个星期
