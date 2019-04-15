	.data:
potencia_str:	.asciiz	"pow(n, x): imprime n^x\n"

	.text:
.globl	rotina_potencia

rotina_potencia:
	li	$v0	4
	la	$a0	potencia_str
	syscall

	li	$v0	5	# lê n em v0
	syscall
	
	move	$s6	$v0	# move n p/ s6

	li	$v0	5	# lê x em v0
	syscall
	
	move	$s7	$v0	# move x p/ s7

	addi	$a0	$zero	1	# resposta será dada em a0


potencia_loop:
	beqz	$s7	end_pot_loop	# if x == 0 break
	mul	$a0	$a0	$s6	# ans *= n
	addi	$s7	$s7	-1	# x--
	
	j potencia_loop
	
	
end_pot_loop:
	li	$v0	1
	syscall
	
	j	menu_principal