	.file	"main.c"
	.text
	.globl	MAX_CHAR
	.data
	.align 4
	.type	MAX_CHAR, @object
	.size	MAX_CHAR, 4
MAX_CHAR:
	.long	99
	.section	.rodata
	.align 8
.LC0:
	.string	"Welcome to the Imaginary TM network. Sign in or sign up by "
	.align 8
.LC1:
	.string	"typing 'new' as the username. (Max. characters are 99) "
.LC2:
	.string	"new\n"
	.align 8
.LC3:
	.string	"You entered 'new' as your username. Register at Imaginary TM? (Y/N) > "
.LC4:
	.string	"Sign up aborted. "
.LC5:
	.string	"Invalid Input. "
.LC6:
	.string	"Please enter your password. "
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	MAX_CHAR(%rip), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -56(%rbp)
	cltq
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L2:
	cmpq	%rdx, %rsp
	je	.L3
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L2
.L3:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L4
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L4:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -48(%rbp)
	movl	MAX_CHAR(%rip), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -40(%rbp)
	cltq
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L5:
	cmpq	%rdx, %rsp
	je	.L6
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L5
.L6:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L7
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L7:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -32(%rbp)
	movq	stdin(%rip), %rdx
	movl	MAX_CHAR(%rip), %ecx
	movq	-48(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	movq	-48(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L8
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -57(%rbp)
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	tolower@PLT
	movb	%al, -57(%rbp)
	cmpb	$110, -57(%rbp)
	jne	.L9
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L10
.L9:
	cmpb	$121, -57(%rbp)
	je	.L15
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$3, %eax
	jmp	.L10
.L15:
	nop
.L12:
	call	getchar@PLT
	cmpl	$10, %eax
	jne	.L12
	movl	$0, %eax
	call	makeNewAccount
	movl	$0, %eax
	jmp	.L10
.L8:
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	stdin(%rip), %rdx
	movl	MAX_CHAR(%rip), %ecx
	movq	-32(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	movl	$0, %eax
.L10:
	movq	%rbx, %rsp
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
.LC7:
	.string	"Making new account..."
	.align 8
.LC8:
	.string	"Please enter your new username >"
.LC9:
	.string	"Does %s look correct? (Y/N) >"
.LC10:
	.string	"Retry?"
	.align 8
.LC11:
	.string	"Please enter your new password >"
	.text
	.globl	makeNewAccount
	.type	makeNewAccount, @function
makeNewAccount:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movl	MAX_CHAR(%rip), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -88(%rbp)
	cltq
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L17:
	cmpq	%rdx, %rsp
	je	.L18
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L17
.L18:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L19
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L19:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -80(%rbp)
	movl	MAX_CHAR(%rip), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -72(%rbp)
	cltq
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L20:
	cmpq	%rdx, %rsp
	je	.L21
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L20
.L21:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L22
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L22:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -64(%rbp)
	movl	MAX_CHAR(%rip), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -56(%rbp)
	cltq
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L23:
	cmpq	%rdx, %rsp
	je	.L24
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L23
.L24:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L25
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L25:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -48(%rbp)
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L30:
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rdx
	movl	MAX_CHAR(%rip), %ecx
	movq	-64(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	je	.L26
	movq	-40(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-64(%rbp), %rax
	movzbl	(%rax,%rdx), %eax
	cmpb	$10, %al
	jne	.L26
	movq	-40(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-64(%rbp), %rax
	movb	$0, (%rax,%rdx)
.L26:
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movl	%eax, %edx
	movq	-80(%rbp), %rax
	movb	%dl, (%rax)
	movq	-80(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	movl	%eax, %edx
	movq	-80(%rbp), %rax
	movb	%dl, (%rax)
	nop
.L27:
	call	getchar@PLT
	cmpl	$10, %eax
	jne	.L27
	movq	-80(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$121, %al
	jne	.L28
	jmp	.L29
.L28:
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L30
.L29:
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rdx
	movl	MAX_CHAR(%rip), %ecx
	movq	-48(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L31
	movq	-32(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-48(%rbp), %rax
	movzbl	(%rax,%rdx), %eax
	cmpb	$10, %al
	jne	.L31
	movq	-32(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-48(%rbp), %rax
	movb	$0, (%rax,%rdx)
.L31:
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movl	%eax, %edx
	movq	-80(%rbp), %rax
	movb	%dl, (%rax)
	movq	-80(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	movl	%eax, %edx
	movq	-80(%rbp), %rax
	movb	%dl, (%rax)
	nop
.L32:
	call	getchar@PLT
	cmpl	$10, %eax
	jne	.L32
	movq	-80(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$121, %al
	je	.L38
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L29
.L38:
	nop
	movl	$0, %eax
	movq	%rbx, %rsp
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L36
	call	__stack_chk_fail@PLT
.L36:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	makeNewAccount, .-makeNewAccount
	.ident	"GCC: (Gentoo 13.3.1_p20240614 p17) 13.3.1 20240614"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
