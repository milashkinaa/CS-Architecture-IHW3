	.file	"calculation.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC4:
	.string	"w"
.LC5:
	.string	"output.txt"
.LC6:
	.string	"%lf"
.LC7:
	.string	"%lf\n"
	.align 8
.LC9:
	.string	"The elapsed time is %f seconds"
	.text
	.globl	calculation
	.type	calculation, @function
calculation:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	movsd	QWORD PTR -72[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -16[rbp], xmm0
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	movsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR -32[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]
	movsd	QWORD PTR -8[rbp], xmm0
	jmp	.L2
.L3:
	movsd	xmm0, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	formula@PLT
	movq	rax, xmm0
	mov	QWORD PTR -40[rbp], rax
	movsd	xmm0, QWORD PTR -40[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
.L2:
	movsd	xmm0, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	formula@PLT
	movq	rax, xmm0
	movq	xmm0, rax
	subsd	xmm0, QWORD PTR -8[rbp]
	movq	xmm1, QWORD PTR .LC3[rip]
	andpd	xmm0, xmm1
	comisd	xmm0, QWORD PTR -32[rbp]
	jnb	.L3
	lea	rax, .LC4[rip]
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC6[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	edi, 3
	call	sleep@PLT
	call	clock@PLT
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR -24[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC8[rip]
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -16[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	nop
	movq	xmm0, rax
	leave
	ret
	.size	calculation, .-calculation
