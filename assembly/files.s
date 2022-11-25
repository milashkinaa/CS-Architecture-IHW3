	.file	"files.c"                    # files.c
	.intel_syntax noprefix               # используем синтаксис интел
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
	endbr64                                # void files() {
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	lea	rax, .LC0[rip]                 # file = fopen("input.txt", "r");
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT                      # fopen();
	mov	QWORD PTR -8[rbp], rax
	lea	rdx, -16[rbp]                  # fscanf(file,"%lf", &a);
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT            # fscanf();
	mov	rax, QWORD PTR -8[rbp]         # fclose(file);
	mov	rdi, rax
	call	fclose@PLT                     # fclose();
	mov	rax, QWORD PTR -16[rbp]        # validation(a);
	movq	xmm0, rax
	call	validation@PLT                 # validation();
	nop
	leave
	ret                                    # return();
	.size	files, .-files
