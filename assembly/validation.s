	.file	"validation.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC1:
	.string	"Incorrect data. Try again."
	.align 8
.LC2:
	.string	"Correct data. Your answer is..."
	.text
	.globl	validation
	.type	validation, @function
validation:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC0[rip]
	comisd	xmm0, QWORD PTR -8[rbp]
	jb	.L6
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L7
.L6:
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rax
	call	calculation@PLT
.L7:
	nop
	leave
	ret
	.size	validation, .-validation
