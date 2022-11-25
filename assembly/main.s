	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"If you want to scan a value from a file, press 1"
	.align 8
.LC1:
	.string	"If you want to work with a random number, press 2"
	.align 8
.LC2:
	.string	"If you want to enter a value from the console, press 3"
.LC3:
	.string	"%d"
	.align 8
.LC4:
	.string	"You have entered an invalid value. Restart the program."
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	cmp	DWORD PTR -20[rbp], 2
	jne	.L2
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, -4[rbp]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, 1
	jne	.L3
	mov	eax, 0
	call	files@PLT
	jmp	.L7
.L3:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, 2
	jne	.L5
	mov	eax, 0
	call	writing@PLT
	jmp	.L7
.L5:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, 3
	jne	.L6
	mov	eax, 0
	call	console@PLT
	jmp	.L7
.L6:
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L7
.L2:
	mov	eax, 1
	jmp	.L8
.L7:
	mov	eax, 0
.L8:
	leave
	ret
	.size	main, .-main
