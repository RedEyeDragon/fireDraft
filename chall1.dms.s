	.comm	flag,4,4
	.text
	.globl	loadFlag
	.type	loadFlag, @function
loadFlag:
.LFB2:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$16, %esp
	movl	$3, -8(%ebp)
	movl	flag, %ebx
	movl	8(%ebp), %ecx
	movl	$818089009, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, %eax
	addl	$52, %eax
	movb	%al, (%ebx)
	movl	flag, %eax
	leal	1(%eax), %ebx
	movl	8(%ebp), %ecx
	movl	$818089009, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, %eax
	addl	$58, %eax
	movb	%al, (%ebx)
	movl	flag, %eax
	leal	2(%eax), %ebx
	movl	8(%ebp), %ecx
	movl	$818089009, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, %eax
	addl	$53, %eax
	movb	%al, (%ebx)
	jmp	.L2
.L3:
	movl	flag, %ecx
	movl	-8(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -8(%ebp)
	leal	(%ecx,%eax), %ebx
	movl	-8(%ebp), %eax
	movl	8(%ebp), %edx
	leal	(%edx,%eax), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, %eax
	addl	$48, %eax
	movb	%al, (%ebx)
	movl	8(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 8(%ebp)
.L2:
	cmpl	$9, 8(%ebp)
	jg	.L3
	cmpl	$11, -8(%ebp)
	je	.L1
	movl	flag, %eax
	movl	flag, %edx
	movzbl	(%edx), %edx
	subl	$9, %edx
	movb	%dl, (%eax)
	movl	flag, %eax
	leal	1(%eax), %edx
	movl	flag, %eax
	addl	$1, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	sall	$2, %eax
	movb	%al, (%edx)
	movl	flag, %eax
	leal	2(%eax), %ecx
	movl	flag, %eax
	addl	$2, %eax
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movb	%al, (%ecx)
.L1:
	addl	$16, %esp
	popl	%ebx
	popl	%ebp
	ret
.LFE2:
	.size	loadFlag, .-loadFlag
	.section	.rodata
	.align 4
.LC0:
	.string	"Pl34s3 3nt3r th3 n0t s0 s3cr3t numb3r:"
.LC1:
	.string	"%d"
.LC2:
	.string	"Now processing..."
.LC3:
	.string	"Almost!"
	.align 4
.LC4:
	.string	"Correct secret number (seriously)!"
.LC5:
	.string	"Processing flag value..."
.LC6:
	.string	"Thanks for playing our game!"
.LC7:
	.string	"Perhaps the flag is: '%s'\n"
	.text
	.globl	awesomeFuncB
	.type	awesomeFuncB, @function
awesomeFuncB:
.LFB3:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	$.LC0, (%esp)
	call	puts
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	__isoc99_scanf
	movl	$.LC2, (%esp)
	call	puts
	movl	$40, (%esp)
	call	awesomeFuncA
	movl	-16(%ebp), %eax
	testl	%eax, %eax
	jne	.L6
	movl	$3, -16(%ebp)
	jmp	.L7
.L6:
	movl	-16(%ebp), %eax
	cmpl	$1, %eax
	jne	.L8
	movl	-16(%ebp), %eax
	imull	$341, %eax, %eax
	movl	%eax, -16(%ebp)
	jmp	.L7
.L8:
	movl	-16(%ebp), %eax
	cmpl	$2, %eax
	jne	.L9
	call	getchar
	jmp	.L7
.L9:
	movl	-16(%ebp), %eax
	cmpl	$3, %eax
	jne	.L10
	movl	-16(%ebp), %eax
	imull	$341, %eax, %eax
	movl	%eax, -16(%ebp)
	jmp	.L7
.L10:
	movl	-16(%ebp), %eax
	cmpl	$41, %eax
	jne	.L11
	movl	$.LC3, (%esp)
	call	puts
	movl	$41, (%esp)
	call	awesomeFuncA
	movl	%eax, -12(%ebp)
	jmp	.L7
.L11:
	movl	-16(%ebp), %eax
	cmpl	$42, %eax
	jne	.L12
	movl	$.LC4, (%esp)
	call	puts
	jmp	.L7
.L12:
	movl	-16(%ebp), %eax
	cmpl	$43, %eax
	jne	.L13
	movl	$.LC5, (%esp)
	call	puts
	movl	-16(%ebp), %eax
	imull	$100, %eax, %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	awesomeFuncA
	movl	%eax, -12(%ebp)
	jmp	.L7
.L13:
	movl	-16(%ebp), %eax
	cmpl	$44, %eax
	jne	.L7
	movl	$.LC6, (%esp)
	call	puts
	movl	$0, %eax
	jmp	.L16
.L7:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	loadFlag
	movl	flag, %eax
	movl	%eax, 4(%esp)
	movl	$.LC7, (%esp)
	call	printf
	call	rand
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L15
	call	rand
	movl	%eax, %ecx
	movl	$818089009, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$42, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	jmp	.L16
.L15:
	call	awesomeFuncB
.L16:
	leave
	ret
.LFE3:
	.size	awesomeFuncB, .-awesomeFuncB
	.globl	awesomeFuncA
	.type	awesomeFuncA, @function
awesomeFuncA:
.LFB4:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$20, %esp
	cmpl	$0, 8(%ebp)
	jns	.L18
	movl	$0, %eax
	jmp	.L19
.L18:
	movl	8(%ebp), %eax
	testl	%eax, %eax
	je	.L21
	cmpl	$1, %eax
	je	.L22
	jmp	.L23
.L21:
	movl	$1, %eax
	jmp	.L19
.L22:
	movl	$2, %eax
	jmp	.L19
.L23:
	movl	8(%ebp), %eax
	subl	$1, %eax
	movl	%eax, (%esp)
	call	awesomeFuncA
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	subl	$2, %eax
	movl	%eax, (%esp)
	call	awesomeFuncA
	addl	%ebx, %eax
.L19:
	addl	$20, %esp
	popl	%ebx
	popl	%ebp
	ret
.LFE4:
	.size	awesomeFuncA, .-awesomeFuncA
	.globl	main
	.type	main, @function

 main:

	andl	$-16, %esp
	subl	$16, %esp
	movl	$11, (%esp)
	call	malloc
	movl	%eax, flag
	movl	$0, (%esp)
	call	time
	movl	%eax, (%esp)
	call	srand
	call	awesomeFuncB
	leave
	ret

