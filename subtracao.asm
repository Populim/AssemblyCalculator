	.data:
sub_str:	.asciiz	"sub(a, b): imprime a - b\n"

	.text:
.globl	rotina_sub

rotina_sub:
	li	$v0	4
	la	$a0	sub_str
	syscall

	li	$v0	5	# lê n em v0
	syscall
	
	move	$s6	$v0	# move n p/ s6

	li	$v0	5	# lê x em v0
	syscall
	
	move	$s7	$v0	# move x p/ s7

	li	$v0	1
	subu	$a0	$s6	$s7	# a - b
	syscall

	j	menu_principal
