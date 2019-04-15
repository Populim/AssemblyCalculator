	.data:
tabuada_str:	.asciiz	"tab(n): imprime a tabuada de n\n"

	.text:
.globl	rotina_tabuada

rotina_tabuada:
	li	$v0	4
	la	$a0	tabuada_str
	syscall

	li	$v0	5	# lê n em v0
	syscall
	
	move	$a1	$v0	# move n p/ a1
	
	addu	$s5	$zero	$a1	# armazena resultado em s5 (começa com n)
	addi	$s7	$zero	11	# armazena 11 constante em s7
	addi	$s6	$zero	1	# armazena o iterador que vai de 1 a 10
	
tabuada_loop:
	beq	$s6	$s7	end_tabuada_loop	# if i == 11
	
	li	$v0	1
	move	$a0	$s5	# imprime n*i
	syscall
	
	li	$v0	11
	li	$a0	' '	# imprime o espaço
	syscall
	
	
	addi	$s6	$s6	1	# i++
	addu	$s5	$s5	$a1	# s5 += n
	
	j tabuada_loop

end_tabuada_loop:
	j	menu_principal
	
menu_principal:
	
	li 	$v0	10
	syscall
