; ��Loader.bin�ļ��ж�����һ��32λ�Ĵ����, ���ѡ����ΪSelectorFlatC, ��ֵΪ8
; �ڴ˴���SELECTOR_KERNEL_CS��ֵΪ8, �ô�ѡ���ӱ�ʾͬһ����
;SELECTOR_KERNEL_CS	equ	8
postion				equ	0

%include "sconst.inc"

; ���뺯����ȫ�ֱ���
extern	cstart
extern	gdt_ptr
extern 	idt_ptr
extern	disp_pos
extern	exception_handler
extern	spurious_irq
extern	fishos_main
extern	tss
extern	p_proc_ready
	
[SECTION .bss]
; resb, 
StackSpace	resb	2 * 1024
StackTop:			; ջ��
[section .text]			; �����ڴ�
global	_start			; ���� _start
global	restart
global	divide_error		; ��������
global	single_step_exception 	; �����쳣
global	nmi			; ���������ж�
global	breakpoint_exception	; ���Զϵ�
global	overflow		; ���
global	bounds_check		; �߽���
global	inval_opcode		; �Ƿ�������
global	copr_not_available	; 
global	double_fault		; ˫�ش���, �����ܲ����쳣��NMI��INTR��ָ��
global	copr_seg_overrun	; 
global	inval_tss		; �Ƿ�TSS
global	segment_not_present	; �β�����
global	stack_exception		; ��ջ���쳣
global	general_protection	; ���汣������
global	page_fault		; ҳ����
global	copr_error		; 
global	hwint00
global  hwint01
global  hwint02
global  hwint03
global  hwint04
global  hwint05
global  hwint06
global  hwint07
global  hwint08
global  hwint09
global  hwint10
global  hwint11
global  hwint12
global  hwint13
global  hwint14
global  hwint15

_start:
	; ��esp��loaderŲ��kernel
	mov	esp, StackTop	; ��ջ��bss����
	sgdt	[gdt_ptr]	; cstart()�н����õ�gdt_ptr
	call	cstart		; �ڴ˺����иı���gdt_ptr, ����ָ���µ�gdt
	lgdt	[gdt_ptr]	; ʹ���µ�gdt
	lidt	[idt_ptr]	; use new idt
	mov		edi, postion
	jmp	SELECTOR_KERNEL_CS:csinit
csinit:					; �����תָ��ǿ��ʹ�øոճ�ʼ���Ľṹ
;	mov		edi, postion
;	sti
	xor		eax, eax
	mov		ax, SELECTOR_TSS
	ltr		ax
	jmp		fishos_main
;	hlt

%macro	hwint_master	1
	push	%1
	call	spurious_irq
	add		esp, 4
	hlt
%endmacro

ALIGN	16
hwint00:				; Interrupt routine for irq 0 (the clock).
	hwint_master	0

%macro	hwint_keyboard	1
	push	%1
	call	spurious_irq
	mov		ah, 74h
	mov		al, 'h'
	mov		[gs:edi], ax
	add		edi, 2
	push	ax
	mov		ah, 01h
;	int		21
	mov		ah, 0Fh
;	mov		al, 'h'
	mov		[gs:edi], ax
	add		edi, 2
	add		esp, 4
	pop		ax
;	iretd
	hlt
%endmacro

ALIGN	16
hwint01:				; Interrupt routine for irq 1 (keyboard).
	hwint_keyboard	1
;	hwint_master	1

ALIGN	16
hwint02:				; Interrupt routine for irq 2 (cascade!).
	hwint_master	2

ALIGN   16
hwint03:                ; Interrupt routine for irq 3 (second serial)
    hwint_master    3

ALIGN   16
hwint04:                ; Interrupt routine for irq 4 (first serial)
    hwint_master    4

ALIGN   16
hwint05:                ; Interrupt routine for irq 2 (XT winchester)
    hwint_master    5

ALIGN   16
hwint06:                ; Interrupt routine for irq 6 (floppy).
    hwint_master    6

ALIGN   16
hwint07:                ; Interrupt routine for irq 7 (printer).
    hwint_master    7

%macro	hwint_slave	1
	push	%1
	call	spurious_irq
	add		esp, 4
	hlt
%endmacro

ALIGN	16
hwint08:
	hwint_slave	8
ALIGN   16
hwint09:
	hwint_slave 9
ALIGN   16
hwint10:
	hwint_slave 10
ALIGN   16
hwint11:
	hwint_slave 11
ALIGN   16
hwint12:
	hwint_slave	12
ALIGN   16
hwint13:
	hwint_slave	13
ALIGN   16
hwint14:
	hwint_slave	14
ALIGN   16
hwint15:
	hwint_slave	15

; �жϺ��쳣 -- �쳣
divide_error:
	push	0xFFFFFFFF	; no err code
	push	0		; vector_no = 0
	jmp	exception			

single_step_exception :
	push	0xFFFFFFFF	; no err code
	push	1		; vector_no = 1
	jmp	exception			

nmi:
	push	0xFFFFFFFF	; no err code
	push	2		; vector_no = 2
	jmp	exception			

breakpoint_exception:
	push	0xFFFFFFFF	; no err code
	push	3		; vector_no = 3
	jmp	exception			

overflow:
	push	0xFFFFFFFF	; no err code
	push	4		; vector_no = 4
	jmp	exception			
			
bounds_check:
	push	0xFFFFFFFF	; no err code
	push	5		; vector_no = 5
	jmp	exception			

inval_opcode:
	push	0xFFFFFFFF	; no err code
	push	6		; vector_no = 6
	jmp	exception			

copr_not_available:
	push	0xFFFFFFFF	; no err code
	push	7		; vector_no = 7
	jmp	exception			

double_fault:
	push	8		; vector_no = 8
	jmp	exception			

copr_seg_overrun:
	push	0xFFFFFFFF	; no err code
	push	9		; vector_no = 9
	jmp	exception			

inval_tss:
	push	10		; vector_no = A
	jmp	exception			

segment_not_present:
	push	11		; vector_no = B
	jmp	exception			

stack_exception:
	push	12		; vector_no = C
	jmp	exception			

general_protection:
	push	13		; vector_no = D
	jmp	exception			

page_fault:
	push	14		; vector_no = E
	jmp	exception			

copr_error:
	push	0xFFFFFFFF	; no err code
	push	16		; vector_no = 10h
	jmp	exception			

exception:
	call	exception_handler
	add	esp, 4 * 2	; ��ջ��ָ��eip, ��ջ�дӶ�����������: eip, cs, eflags
	hlt

restart:
	mov		esp, [p_proc_ready]
	lldt		[esp + P_LDT_SEL]
	lea		eax, [esp + P_STACKTOP]
	mov		dword [tss + TSS3_S_SP0], eax
	pop		gs
	pop		fs
	pop		ax
	mov		es, ax
	pop		ax
	mov		ds, ax
	popad
	add		esp, 4
	iretd


