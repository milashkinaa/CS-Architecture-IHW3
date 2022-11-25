	.file	"console.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"w"
.LC1:
	.string	"input.txt"
.LC2:
	.string	"Enter the number..."
.LC3:
	.string	"%lf"
	.text
	.globl	console
	.type	console, @function
console:
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
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, -16[rbp]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rax
	call	validation@PLT
	nop
	leave
	ret
	.size	console, .-console
