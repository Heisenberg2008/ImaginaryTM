	.file	"main.c"
	.text
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
	.string	"Creating new account..."
.LC7:
	.string	"\nBEGIN DEBUG"
	.align 8
.LC8:
	.string	"The recognized username is: %s \n"
	.align 8
.LC9:
	.string	"The recognized password is: %s \n"
.LC10:
	.string	"END DEBUG \n"
.LC11:
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
	subq	$352, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	stdin(%rip), %rdx
	leaq	-336(%rbp), %rax
	movl	$99, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	-336(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -337(%rbp)
	movsbl	-337(%rbp), %eax
	movl	%eax, %edi
	call	tolower@PLT
	movb	%al, -337(%rbp)
	cmpb	$110, -337(%rbp)
	jne	.L3
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L7
.L3:
	cmpb	$121, -337(%rbp)
	je	.L5
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$3, %eax
	jmp	.L7
.L5:
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
.L6:
	call	getchar@PLT
	cmpl	$10, %eax
	jne	.L6
	leaq	-224(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	makeNewAccountUsername
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	makeNewAccountPassword
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-224(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L7
.L2:
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	stdin(%rip), %rdx
	leaq	-112(%rbp), %rax
	movl	$99, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	movl	$0, %eax
.L7:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC12:
	.string	"Please enter your new username >"
.LC13:
	.string	"Does %s look correct? (Y/N) >"
.LC14:
	.string	"Retry?"
	.text
	.globl	makeNewAccountUsername
	.type	makeNewAccountUsername, @function
makeNewAccountUsername:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L14:
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rdx
	movq	-40(%rbp), %rax
	movl	$99, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L10
	movq	-24(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L10
	movq	-24(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
.L10:
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -10(%rbp)
	movzbl	-10(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	movb	%al, -10(%rbp)
	nop
.L11:
	call	getchar@PLT
	cmpl	$10, %eax
	jne	.L11
	movzbl	-10(%rbp), %eax
	cmpb	$121, %al
	je	.L17
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L14
.L17:
	nop
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	makeNewAccountUsername, .-makeNewAccountUsername
	.section	.rodata
	.align 8
.LC15:
	.string	"Please enter your new password >"
	.text
	.globl	makeNewAccountPassword
	.type	makeNewAccountPassword, @function
makeNewAccountPassword:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movq	%rdi, -136(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L23:
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rdx
	movq	-136(%rbp), %rax
	movl	$99, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -120(%rbp)
	cmpq	$0, -120(%rbp)
	je	.L19
	movq	-120(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L19
	movq	-120(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
.L19:
	movq	-136(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -112(%rbp)
	movzbl	-112(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	movb	%al, -112(%rbp)
	nop
.L20:
	call	getchar@PLT
	cmpl	$10, %eax
	jne	.L20
	movzbl	-112(%rbp), %eax
	cmpb	$121, %al
	je	.L26
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L23
.L26:
	nop
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	makeNewAccountPassword, .-makeNewAccountPassword
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
