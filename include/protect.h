#ifndef _TINIX_PROTECT_H_
#define _TINIX_PROTECT_H_

// 存储段描述符/系统段描述符， 一个段描述符8B
typedef	struct s_descriptor	{	// 共8字节
	t_16	limit_low;			// 段界限低16位
	t_16	base_low;			// 段基址低16位
	t_8		base_mid;			// 段基址中间8位
	t_8		attr1;				// 段属性, TYPE(4), S(1), DPL(2), P(1), 详细信息参见pm.inc文件
	t_8		limit_high_attr2;	// 段界限高四位(4), AVL(1), 0(1), D(1), G(1)
	t_8		base_high;			// 段基址高8位
}DESCRIPTOR;

// Descriptor of gate
typedef struct s_gate {
	t_16	offset_low;			// offset low
	t_16	selector;			// Selector
	t_8		dcount;				// This fild is only effective in diaoyongGate Descriptor.
	t_8		attr;				// attribute
	t_16	offset_high;		// offset high
}GATE;

typedef struct s_tss {
	t_32	backlink;	// stack pointer to use during interrupt
	t_32	esp0;		// segments
	t_32	ss0;
	t_32	esp1;
	t_32	bss1;
	t_32	eesp2;
	t_32	sss2;
	t_32	ecr3;
	t_32	eip;
	t_32	flags;
	t_32	eax;
	t_32	ecx;
	t_32	edx;
	t_32	ebx;
	t_32	esp;
	t_32	ebp;
	t_32	esi;
	t_32	edi;
	t_32	es;
	t_32	cs;
	t_32	ss;
	t_32    ds;
	t_32    fs;
	t_32    gs;
	t_32    ldt;
	t_16	trap;
	t_16	iobase;	// If I/O bitmap base address >= TSS segment limit, there is no I/O permit bitmap	
}TSS;

// Every task has its own LDT, and this is the number of the descriptor in the LDT.
#define LDT_SIZE			2

// GDT
// Index of descriptor
#define INDEX_DUMMY			0
#define INDEX_FLAT_C		1
#define INDEX_FLAT_RW		2
#define INDEX_VIDEO			3
#define INDEX_TSS			4
#define	INDEX_LDT_FIRST		5
//Selector
#define SELECTOR_DUMMY		0
#define SELECTOR_FLAT_C		0x08
#define SELECTOR_FLAT_RW	0x10
#define SELECTOR_VIDEO		(0x18 + 3)	// RPL = 3
#define	SELECTOR_TSS		0x20		// TSS
#define	SELECTOR_LDT_FIRST	0x28

#define SELECTOR_KERNEL_CS	SELECTOR_FLAT_C
#define SELECTOR_KERNEL_DS	SELECTOR_FLAT_RW
#define	SELECTOR_KERNEL_GS	SELECTOR_VIDEO

//#define	LDT_SIZE	2
// Type of selector
#define	SA_RPL_MASK		0xFFFC
#define SA_RPL0			0
#define SA_RPL1			1
#define SA_RPL2			2
#define SA_RPL3			3

#define SA_TI_MASK		0xFFFB
#define SA_TIG			0
#define SA_TIL			4

// Introduction of descriptor type
#define DA_32		0x4000	// 32 bytes segment
#define DA_LIMIT_4K	0x8000	// duan jie xian li du wei 4k bytes
#define DA_DPL0		0x00	// DPL = 0
#define DA_DPL1		0x20	// DPL = 1
#define DA_DPL2		0x40	// DPL = 2
#define DA_DPL3		0x60	// DPL = 3
// Introduction of storage segment descriptor type value
#define DA_DR		0x90	// Read-only data segment
#define DA_DRW		0x92	// Read and write data segment
#define DA_DRWA		0x93	// Read, write and accessed data segment
#define DA_C		0x98	// Access-only code segment
#define DA_CR		0x9A	// Accessible and read code segment
#define DA_CCO		0x9C	// Accessible-only conforming code segment
#define DA_CCOR		0x9E	// Accessible and read conforming code segment
// Introduction of system segment descriptor type value
#define DA_LDT		0x82	// LDT 
#define DA_TaskGate	0x85	// Task Gate
#define DA_386TSS	0x89	// Available 386 task state segment type value
#define DA_386CGate	0x8C	// 386 diaoyongGate type value
#define DA_386IGate	0x8E	// 386 Interrupt Gate type value
#define DA_386TGate 0x8F	// 386 Trap Gate type value
//Interrupt vector
#define INT_VECTOR_DIVIDE		0x0
#define INT_VECTOR_DEBUG		0x1
#define INT_VECTOR_NMI			0x2
#define INT_VECTOR_BREAKPOINT	0x3
#define INT_VECTOR_OVERFLOW		0x4
#define INT_VECTOR_BOUNDS		0x5
#define INT_VECTOR_INVAL_OP		0x6
#define INT_VECTOR_COPROC_NOT	0x7
#define INT_VECTOR_DOUBLE_FAULT	0x8
#define INT_VECTOR_COPROC_SEG	0x9
#define INT_VECTOR_INVAL_TSS	0xA
#define INT_VECTOR_SEG_NOT		0xB
#define INT_VECTOR_STACK_FAULT	0xC
#define INT_VECTOR_PROTECTION	0xD
#define INT_VECTOR_PAGE_FAULT	0xE
#define INT_VECTOR_COPROC_ERR	0x10


// Interrupt vector
#define	INT_VECTOR_IRQ0		0x20
#define	INT_VECTOR_IRQ8		0x28

#define	vir2phys(seg_base, vir) (t_32) (((t_32)seg_base) + (t_32)(vir))

#endif	// _TINIX_PROTECT_H_
