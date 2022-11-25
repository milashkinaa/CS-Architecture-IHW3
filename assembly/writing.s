	.file	"writing.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"w"
.LC1:
	.string	"input.txt"
.LC2:
	.string	"%lf"
.LC3:
	.string	"Generated number is..."
.LC4:
	.string	"%lf\n"
	.text
	.globl	writing
	.type	writing, @function
writing:
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
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	QWORD PTR -16[rbp], xmm0
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rax
	call	validation@PLT
	nop
	leave
	ret
	.size	writing, .-writing
