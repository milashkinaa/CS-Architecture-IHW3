        .file	"console.c"                           # файл console.s
	.intel_syntax noprefix                        # используем синтаксис интел
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
	endbr64                                      # console() { 
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	lea	rax, .LC0[rip]                       # file = fopen("input.txt", "w");
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT                            # fopen();
	mov	QWORD PTR -8[rbp], rax
	lea	rax, .LC2[rip]                       # printf("%s\n", "Enter the number...");
	mov	rdi, rax
	call	puts@PLT                             # puts();
	lea	rax, -16[rbp]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT                   # scanf();
	mov	rdx, QWORD PTR -16[rbp]              # fprintf(file,"%lf", a);
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT                          # fprintf();
	mov	rax, QWORD PTR -8[rbp]               # fclose(file);
	mov	rdi, rax
	call	fclose@PLT                           # fclose();
	mov	rax, QWORD PTR -16[rbp]              # validation(a);
	movq	xmm0, rax
	call	validation@PLT                       # validation();
	nop
	leave
	ret                                          # return();
	.size	console, .-console
