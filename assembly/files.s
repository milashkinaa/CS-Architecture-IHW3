	.file	"files.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"input.txt"
.LC2:
	.string	"%lf"
	.text
	.globl	files
	.type	files, @function
files:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	lea	rax, .LC0[rip]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	lea	rdx, -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rax
	call	validation@PLT
	nop
	leave
	ret
	.size	files, .-files
