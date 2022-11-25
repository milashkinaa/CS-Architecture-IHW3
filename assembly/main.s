	.file	"main.c"                                                             # main.c
	.intel_syntax noprefix                                                       # используем синтаксис интел
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
main:                                                                                  # main()
	endbr64                                                                        # int main(int argc, char** argv) {
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	cmp	DWORD PTR -20[rbp], 2                                                  # if (argc == 2) {
	jne	.L2                                                                    # .L2
	lea	rax, .LC0[rip]                                                         # printf("%s\n", "If you want to scan a value from a file, press 1");
	mov	rdi, rax
	call	puts@PLT						               # puts();
	lea	rax, .LC1[rip]                                                         # printf("%s\n", "If you want to work with a random number, press 2");
	mov	rdi, rax
	call	puts@PLT							       # puts();
	lea	rax, .LC2[rip]                                                         # printf("%s\n", "If you want to enter a value from the console, press 3");
	mov	rdi, rax
	call	puts@PLT							       # puts();
	lea	rax, -4[rbp]                                                           # scanf("%d", &a);
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT                                                     # scanf();
	mov	eax, DWORD PTR -4[rbp]                                                 # if (a == 1) {
	cmp	eax, 1
	jne	.L3                                                                    # .L3
	mov	eax, 0                                                 
	call	files@PLT                                                              # files();
	jmp	.L7                                                                    # .L7
.L3:
	mov	eax, DWORD PTR -4[rbp]                                                 # } else if (a == 2) {
	cmp	eax, 2 
	jne	.L5							               # .L5
	mov	eax, 0
	call	writing@PLT                                                            # writing();
	jmp	.L7                                                                    # .L7
.L5:
	mov	eax, DWORD PTR -4[rbp]                                                 # } else if (a == 3) {
	cmp	eax, 3
	jne	.L6                                                                    # .L6
	mov	eax, 0
	call	console@PLT                                                            # console();
	jmp	.L7                                                                    # .L7
.L6:
	lea	rax, .LC4[rip]                                                         # } else {
	mov	rdi, rax                                                               # printf("%s\n", "You have entered an invalid value. Restart the program.");
	call	puts@PLT                                                               # putc();
	jmp	.L7                          	                                       # .L7
.L2:	
	mov	eax, 1                                                                 # return 1;
	jmp	.L8                                                                    # .L8
.L7: 
	mov	eax, 0                                                                 # return 1;
.L8: 
	leave
	ret                                                                            # return();
	.size	main, .-main
