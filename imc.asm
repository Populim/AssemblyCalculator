	.data:
dig_massa_str:	.asciiz "Digite sua massa corpórea em KG\n"
dig_altura_str:	.asciiz "Digite sua altura em metros. (Ex: 1.52)\n"
imc_str:	.asciiz	"Seu IMC é de "
barra_n:	.asciiz "\n"


	.text:
.globl	rotina_imc

rotina_imc:
	li	$v0	4
	la	$a0	dig_massa_str
	syscall			#Imprime "Digite sua massa..."

	li	$v0	6	
	syscall			# lê a massa em f0
	
	mov.s 	$f1	$f0	# f1 recebe f0
	
	li	$v0	4
	la	$a0	dig_altura_str
	syscall			#Imprime "Digite sua altura..."
	
	li	$v0	6	# lê a altura em f0
	syscall
	
	mov.s 	$f2	$f0	# f2 recebe f0
	
	mul.s 	$f2	$f2	$f2	# f2 = (f2)^2
	
	div.s 	$f1	$f1	$f2	# f1 = IMC = massa/altura²
	
	li	$v0	4
	la	$a0	imc_str
	syscall			# Imprime "Seu IMC é de..."
	
	li	$v0	2
	mov.s	$f12	$f1	
	syscall			# imprime o IMC
	
	li	$v0	4
	la	$a0	barra_n 
	syscall			# imprime um \n para formatar a saída
	
	
	

	j	menu_principal