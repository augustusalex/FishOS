#ifndef	_TINIX_CONST_H_
#define _TINIX_CONST_H_

// ��������, �˴������PRIVATE�Ĺ�����static�Ĺ�����ͬ, PUBLIC�Ĺ����൱��������
#define	PUBLIC				// PUBLIC������PRIVATE�����෴
#define	PRIVATE		static	// PRIVATE x����x��������
#define	EXTERN		extern	// EXTERN is defined as extern except in global.c.

// Boolean
#define	TRUE	1
#define FALSE	0

// GDT �� IDT���������ĸ���
#define	GDT_SIZE	128
#define	IDT_SIZE	256

// Number of process
#define	NR_TASKS	1

// Privilege
#define PRIVILEGE_KRNL	0
#define PRIVILEGE_TASK	1
#define PRIVILEGE_USER	3

// RPL
#define	RPL_KRNL	SA_RPL0
#define	RPL_TASK	SA_RPL1
#define	RPL_USER	SA_RPL3

// 8259A interrupt controller ports.
// I/O port for interrupt controller		<Master>
#define	INT_M_CTL		0x20
// Setting bits in this port disables ints	<Master>
#define	INT_M_CTLMASK	0x21
// I/O port for second interrupt controller	<Slave>
#define INT_S_CTL		0xA0
// Setting bits in this port disables ints	<Slave>
#define INT_S_CTLMASK	0xA1

#endif //_TINIX_CONST_H_
