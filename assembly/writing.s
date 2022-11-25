	.file	"writing.c"                          # writing.c
	.intel_syntax noprefix                       # используем синтаксис интел
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
writing:                                             # void writing() {
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	lea	rax, .LC0[rip]                       # file = fopen("input.txt", "w");
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT                            # fopen();
	mov	QWORD PTR -8[rbp], rax               # double a = rand();
	call	rand@PLT                             # rand();
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	QWORD PTR -16[rbp], xmm0
	mov	rdx, QWORD PTR -16[rbp]              # fprintf(file,"%lf", a);
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT                          # fprintf();
	mov	rax, QWORD PTR -8[rbp]               # fclose(file);
	mov	rdi, rax 
	call	fclose@PLT                           # fclose();
	lea	rax, .LC3[rip]                       # printf("%s\n", "Generated number is...");
	mov	rdi, rax             
	call	puts@PLT                             # puts();                
	mov	rax, QWORD PTR -16[rbp]              # printf("%lf\n", a);
	movq	xmm0, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT                           # printf();
	mov	rax, QWORD PTR -16[rbp]              # validation(a);
	movq	xmm0, rax
	call	validation@PLT                       # validation();
	nop
	leave
	ret                                          # return();
	.size	writing, .-writing
