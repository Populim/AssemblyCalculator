	.data:
fatorial_str:	.asciiz	"fat(n): Imprime fatorial de n\n"
barra_n: .asciiz "\n"
	
		
	.text:
.globl	rotina_fatorial


rotina_fatorial:

	li	$v0	4
	la	$a0	fatorial_str
	syscall

	li	$v0	5	# lê n em v0
	syscall
	
	move	$a0	$v0	# move n p/ a0, para ser o argumento
	
	jal	fatorial	# argumento (n) em a0, retorno em v0
	
	move	$a0	$v0	# copia retorno p/ a0
	
	li	$v0	1
	syscall			# imprime o valor obtido
	
	li	$v0	4
	la	$a0	barra_n
	syscall			# imprime um \n para formatar a saída
	
	 
		
	j	menu_principal




fatorial:
	# fat(n):
	# 	if n == 1 return 1 
	# 	return n*fat(n - 1)

	addi	$sp	$sp	-8	# aloca espaço na stack
	sw 	$a0	4($sp)		# armazena o argumento 
	sw	$ra	0($sp)		# armazena o return address na stack
	
	ble 	$a0	$s1	base	# if n == 1 return 1
					# else
	addi	$a0	$a0	-1	# proximo argumento (n-1)
	jal	fatorial		# pegar fat(n-1) em v0

	lw	$a0	4($sp)		# recupero o meu argumento (n)
	mul	$v0	$a0	$v0	# v0 = n*fat(n-1)
	lw	$ra	0($sp)		# recupero return address
	
	addi	$sp	$sp	8	# desempilho
	jr	$ra			# retorno

base:
	lw	$a0	4($sp)		# recupero o meu argumento (n)
	lw	$ra	0($sp)		# recupero return address
	
	addi	$v0	$zero	1	# escrevo 1 no retorno
	
	addi	$sp	$sp	8	# desempilho
	jr	$ra			# retorno
