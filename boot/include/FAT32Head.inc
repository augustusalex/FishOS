	; �ļ�ϵͳ��������Ϣ
	OEM_ID				db	"FishOS  "	; OEM(ԭʼ�豸������)����, ����ռ��8�ֽ�
	BytesPerSector		dw	0x0200		; ÿ�����ֽ���
	SectorsPerCluster	db	0x01		; ÿ��������
	ReservedSectors		dw	0x0026		; ����������
	NumberOfFAT			db	0x02		; FAT������
	FlagOfFileSystem	dw	0x0000		; ��ע�ļ�ϵͳΪFAT32
	Kept1				dw	0x0000		; �����ֶ�
	MediaDescriptor		db	0xF8		; ���̽���������, Ӳ��ΪF8
	Kept2				dw	0x0000		; �����ֶ�
	SectorsPerTrack		dw 	0x003f		; ÿ�ŵ�������
	NumberOfTrackHead	dw	0x0010		; ��ͷ��
	HiddenSectors		dd	0x00000000	; ����ǰ���ط����ĸ���
	TotalOfSectors		dd	0x00028000	; �߼������е���������
	SectorsPerFAT		dd	0x000004ED	; ÿ��FAT����������
	MirrorOfFAT			dw	0x0000		; FAT�������־, 0��ʾ������FAT��, ��Ϊ����; 1��ʾ��1��
	FSVersion			dw	0x0000		; �ļ�ϵͳ�����ΰ汾(����)
	RootDirectoryStart	dd	0x00000A00	; ��Ŀ¼����ʼ������
	FSInfoSector		dw	0x0001		; �ļ�ϵͳ��Ϣ������
	BackOfDBR			dw	0x0006		; DBR����������

	TIMES		12		db	0			; �����ֶ�, 12���ֽ�
	PhysicalDriveNumber	db	0xc0		; BIOS��������
	Kept3				db	0x8e		; ����
	Signature			db	0xd0		; ���̶�д������չ��־
	VolumeID			dd	0xb87c00bc	; �����к�
	VolumeLabel			db	"FishOS  FAT"	; ���̾����, ����Ϊ11�ֽ�
	FSType				db	"FAT32   "	; �ļ�ϵͳ��ʶ��

	;����FAT32�ļ�ϵͳ�Ĳ�������  
	SectorsOfDict		equ	63eh		; ��Ŀ¼���̶�������������
	FATStart			equ	20h		; FAT������ʼ����
	NumberOfTrack		equ	65h		; �ŵ���/������
	OffsetOfDictInFAT	equ	08h		; Ŀ¼ɽ����FAT���еı����ƫ��ֵ