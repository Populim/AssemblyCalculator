	.data:
soma_str:	.asciiz	"add(a, b): imprime a + b\n"

	.text:
.globl	rotina_soma

rotina_soma:
	li	$v0	4
	la	$a0	soma_str
	syscall

	li	$v0	5	# lê n em v0
	syscall
	
	move	$s6	$v0	# move n p/ s6

	li	$v0	5	# lê x em v0
	syscall
	
	move	$s7	$v0	# move x p/ s7

	li	$v0	1
	addu	$a0	$s7	$s6	# a + b
	syscall

	j	menu_principal
