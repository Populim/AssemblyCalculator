	.data:
.align	0
menu_string:	.asciiz		"0: Soma\n1: Subtracao\n2: Multiplicacao\n3: Divisao\n4: Potencia\n5: Raiz\n6: Tabuada\n7: IMC\n8: Fatorial\n9: Fibonacci\n10: Sair\n"
operacao_str:	.asciiz		"\nEscolha a operacao\n"

	.text:

.globl	menu_principal
.globl	main

main:

	li	$v0	4
	la	$a0	menu_string		
	syscall					#Exibe as operações possíveis


menu_principal:	
	
	li	$v0	4
	la	$a0	operacao_str		
	syscall					#Exibe a mensagem para escolher uma operação
	
	li	$v0	5	# armazena opcode em v0
	syscall
	
	
	# Registrador com os possiveis opcodes: $s7
	addi	$s7	$zero	0
	beq	$s7	$v0	rotina_soma	# 0	Soma
	addi	$s7	$s7	1
	beq	$s7	$v0	rotina_sub	# 1	Subtração
	addi	$s7	$s7	1
	beq	$s7	$v0	rotina_mult	# 2	Multiplicação
	addi	$s7	$s7	1
	beq	$s7	$v0	rotina_div	# 3	Divisao
	addi	$s7	$s7	1
	beq	$s7	$v0	rotina_potencia	# 4	Potencia
	addi	$s7	$s7	1
	beq	$s7	$v0	rotina_sqrt	# 5	Raiz quadrada
	addi	$s7	$s7	1
	beq	$s7	$v0	rotina_tabuada	# 6	Tabuada
	addi	$s7	$s7	1
	beq	$s7	$v0	rotina_imc	# 7	IMC
	addi	$s7	$s7	1
	beq	$s7	$v0	rotina_fatorial	# 8	Fatorial
	addi	$s7	$s7	1
	beq	$s7	$v0	rotina_fibonacci# 9	Fibonacci
	addi	$s7	$s7	1
	beq	$s7	$v0	exit		# 10	Sair

	j 	exit
	

exit:
	li	$v0	10
	syscall
