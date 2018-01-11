	; 文件系统的描述信息
	OEM_ID				db	"FishOS  "	; OEM(原始设备制造商)代号, 必须占满8字节
	BytesPerSector		dw	0x0200		; 每扇区字节数
	SectorsPerCluster	db	0x01		; 每簇扇区数
	ReservedSectors		dw	0x0026		; 保留扇区数
	NumberOfFAT			db	0x02		; FAT表个数
	FlagOfFileSystem	dw	0x0000		; 标注文件系统为FAT32
	Kept1				dw	0x0000		; 保留字段
	MediaDescriptor		db	0xF8		; 磁盘介质描述符, 硬盘为F8
	Kept2				dw	0x0000		; 保留字段
	SectorsPerTrack		dw 	0x003f		; 每磁道扇区数
	NumberOfTrackHead	dw	0x0010		; 磁头数
	HiddenSectors		dd	0x00000000	; 分区前隐藏分区的个数
	TotalOfSectors		dd	0x00028000	; 逻辑磁盘中的扇区总数
	SectorsPerFAT		dd	0x000004ED	; 每个FAT表的扇区数
	MirrorOfFAT			dw	0x0000		; FAT表镜像标志, 0表示有两份FAT表, 互为备份; 1表示仅1份
	FSVersion			dw	0x0000		; 文件系统的主次版本(保留)
	RootDirectoryStart	dd	0x00000A00	; 根目录的起始扇区号
	FSInfoSector		dw	0x0001		; 文件系统信息扇区号
	BackOfDBR			dw	0x0006		; DBR备份扇区号

	TIMES		12		db	0			; 保留字段, 12个字节
	PhysicalDriveNumber	db	0xc0		; BIOS驱动器号
	Kept3				db	0x8e		; 保留
	Signature			db	0xd0		; 磁盘读写参数扩展标志
	VolumeID			dd	0xb87c00bc	; 卷序列号
	VolumeLabel			db	"FishOS  FAT"	; 磁盘卷标号, 必须为11字节
	FSType				db	"FAT32   "	; 文件系统标识号

	;基于FAT32文件系统的参数设置  
	SectorsOfDict		equ	63eh		; 根目录区固定扇区的扇区号
	FATStart			equ	20h		; FAT表的起始扇区
	NumberOfTrack		equ	65h		; 磁道数/柱面数
	OffsetOfDictInFAT	equ	08h		; 目录山区在FAT表中的表项的偏移值
