	.file	"calculation.c"                     # код для файла calculation.c
	.intel_syntax noprefix                      # используем синтаксис интел
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
	pxor	xmm0, xmm0                       # double time_spent = 0.0;
	movsd	QWORD PTR -16[rbp], xmm0
	call	clock@PLT                        # clock_t begin = clock();
	mov	QWORD PTR -24[rbp], rax
	movsd	xmm0, QWORD PTR .LC1[rip]        # double e = 0.0000000001;
	movsd	QWORD PTR -32[rbp], xmm0
	pxor	xmm0, xmm0                       # double root = 0;
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]        # double n = 1.0;
	movsd	QWORD PTR -8[rbp], xmm0
	jmp	.L2                                  # .L2
.L3:
	movsd	xmm0, QWORD PTR -72[rbp]         # root = formula(n, a);
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	formula@PLT                      # formula(n, a)
	movq	rax, xmm0
	mov	QWORD PTR -40[rbp], rax
	movsd	xmm0, QWORD PTR -40[rbp]         # n = root;
	movsd	QWORD PTR -8[rbp], xmm0
.L2:
	movsd	xmm0, QWORD PTR -72[rbp]         # while((fabs(formula(n, a) - n)) >= e) {
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	formula@PLT                      # formula(n, a)
	movq	rax, xmm0
	movq	xmm0, rax                        # -
	subsd	xmm0, QWORD PTR -8[rbp]
	movq	xmm1, QWORD PTR .LC3[rip]        # fabs();
	andpd	xmm0, xmm1
	comisd	xmm0, QWORD PTR -32[rbp]         # >=
	jnb	.L3                                  # .L3
	lea	rax, .LC4[rip]                       # out = fopen("output.txt", "w");
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT                        # fopen();
	mov	QWORD PTR -48[rbp], rax             
	mov	rdx, QWORD PTR -8[rbp]               # fprintf(out, "%lf", n);
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC6[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT                      # fprintf();
	mov	rax, QWORD PTR -8[rbp]               # printf("%lf\n", n);
	movq	xmm0, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT                       # printf();
	mov	edi, 3                               # sleep(3);
	call	sleep@PLT                        # sleep();
	call	clock@PLT                        # clock_t end = clock();
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]              # time_spent += (double)(end - begin) / CLOCKS_PER_SEC;
	sub	rax, QWORD PTR -24[rbp]              # - 
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC8[rip]        # /
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -16[rbp]         # +=
	addsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	mov	rax, QWORD PTR -16[rbp]              # printf("The elapsed time is %f seconds", time_spent);
	movq	xmm0, rax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT                       # printf();
	nop                                      # }
	movq	xmm0, rax
	leave
	ret                                      # return
	.size	calculation, .-calculation
