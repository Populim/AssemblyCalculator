	.data:
div_str:	.asciiz	"div(a, b): imprime a / b\n"

	.text:
.globl	rotina_div

rotina_div:
	li	$v0	4
	la	$a0	div_str
	syscall

	li	$v0	6	# lê n em v0
	syscall
	
	mov.s 	$f1 	$f0
  	#cvt.s.w $f1	$f1

	li	$v0	6	# lê x em v0
	syscall
	
	mov.s 	$f2 	$f0
  	#cvt.s.w $f2	$f2
	
	li	$v0	2
	div.s 	$f12	$f0	$f1	# a / b
	syscall

	j	menu_principal