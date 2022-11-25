	.file	"validation.c"                               # validation.c
	.intel_syntax noprefix                               # используем синтаксис интел
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
	endbr64                                              # void validation(double number) {
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	movsd	QWORD PTR -8[rbp], xmm0                      # if (number <= 0.0000000001) {
	movsd	xmm0, QWORD PTR .LC0[rip]
	comisd	xmm0, QWORD PTR -8[rbp]
	jb	.L6                                          # .L6
	lea	rax, .LC1[rip]                               # printf("%s\n", "Incorrect data. Try again.");
	mov	rdi, rax
	call	puts@PLT                                     # putc();
	jmp	.L7                                          # .L7
.L6:
	lea	rax, .LC2[rip]                               # } else {
	mov	rdi, rax                                     # printf("%s\n", "Correct data. Your answer is...");
	call	puts@PLT                                     # putc();
	mov	rax, QWORD PTR -8[rbp]                       # calculation(number);
	movq	xmm0, rax
	call	calculation@PLT                              # calculation();
.L7:
	nop
	leave
	ret                                                  # return();
	.size	validation, .-validation
