#ifdef	GLOBAL_VARIABLES_HERE
#undef	EXTERN
#define	EXTERN
#endif

EXTERN	t_8			gdt_ptr[6]; // 0~15: limit 16~47: base
EXTERN	DESCRIPTOR	gdt[GDT_SIZE];

EXTERN	t_8			idt_ptr[6]; // 0~15: limit 16~47: base
EXTERN	GATE		idt[IDT_SIZE];

EXTERN 	int			disp_pos;

EXTERN	TSS			tss;
EXTERN	PROCESS*	p_proc_ready;

// This is a process table
extern	PROCESS		proc_table[];
extern	char		task_stack[];
