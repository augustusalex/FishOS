#include "type.h"
#include "const.h"
#include "protect.h"
#include "string.h"
#include "proto.h"
#include "proc.h"
#include "global.h"

PUBLIC void cstart() {
	disp_str("\n\n\n\n\n\n-----\"cstart\"   beginned-----\n");
	// 将Loader中的gdt复制到新的gdt中
	memcpy(&gdt,								// New GDT
			(void*)(*((t_32*)(&gdt_ptr[2]))),	// Base of Old GDT
			*((t_16*)(&gdt_ptr[0]))				// Limit of Old GDT
			);
	// gdt_ptr[6]共6字节: 0~15: limit	16~47: base
	// 用作sgdt以及lgdt的参数
	t_16* p_gdt_limit	= (t_16*)(&gdt_ptr[0]);
	t_32* p_gdt_base	= (t_32*)(&gdt_ptr[2]);
	*p_gdt_limit		= GDT_SIZE	*  sizeof(DESCRIPTOR);
	*p_gdt_base			= (t_32)&gdt;
	// idt_ptr[6] has six bytes: 0~15: limit 16~47: base
	// yong zuo sidt and lidt de parameters
	t_16* p_idt_limit	= (t_16*)(&idt_ptr[0]);
	t_32* p_idt_base	= (t_32*)(&idt_ptr[2]);
	*p_idt_limit		= IDT_SIZE * sizeof(GATE) - 1;
	*p_idt_base			= (t_32)&idt;
	init_prot();
	disp_str("-----\"cstart\"	finished-----\n");
}
