	.file	"formula.c"
	.intel_syntax noprefix
	.text
	.globl	formula
	.type	formula, @function
formula:
	endbr64
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	QWORD PTR -16[rbp], xmm1
	movsd	xmm0, QWORD PTR -16[rbp]
	divsd	xmm0, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	addsd	xmm1, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR .LC0[rip]
	mulsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.size	formula, .-formula
