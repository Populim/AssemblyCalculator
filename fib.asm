	.data:
array:		.word	1, 1
fib_string:	.asciiz	"\nfib(L, r): imprime seq. de fib. entre [L, r] (0-based)\n"

	.text:

.globl	rotina_fibonacci

rotina_fibonacci:	# fib(l, r) gera seq. de fib entre L e R
	
	li	$v0	4
	la	$a0	fib_string
	syscall
	
	li	$v0	5	# armazena L em v0
	syscall

	move	$s6	$v0	# move L p/ s6

	li	$v0	5	
	syscall
	move	$s7	$v0	# armazena R em s7
	
	move	$a0	$s6
	
	addi	$s7	$s7	1	# somo 1 em r para que seja [l,r] ao inves de [l,r)
	
	# o argumento que será passado para fib tem que estar em a0
	# como queremos um intervalo, vou manter l em a0 e o incrementar
	# deixando-o em a0 para ser passado como argumento

intervalo_loop:
	bge	$a0	$s7	end_intervalo_loop
	jal	fibonacci		# argumento (n) em a0, retorno em v0
	addi	$a0	$a0	1	#i++

	move	$a1	$a0	# copia i temporariamente para a1

	move	$t0	$v0	# copia retorno p/ t0
	li	$v0	1
	move	$a0	$t0	# imprime fib(i)
	syscall
	
	li	$v0	11
	li	$a0	' '	# imprime o espaço
	syscall
	
	move	$a0	$a1	# volta i para o argumento
	j	intervalo_loop
	
end_intervalo_loop:
	j	menu_principal



fibonacci:
	# fib(n):
	# 	while(n--):
	# 		temp = fib[0]+fib[1]
	#		fib[0] = fib[1]
	#		fib[1] = temp
	
	addi	$t1	$zero	4
	move 	$v0	$a0		# copio n p/ v0 como contador
	addi	$v1	$zero	1	# v1 1 constante

	sw	$v1	array($zero)	# array[0] = 1
	sw	$v1	array($t1)	# array[1] = 1

fib_for_loop:
	ble	$v0	$v1	end_fib_for_loop
	addi	$v0	$v0	-1	# n--
	
	lw	$s0	array($zero)
	lw	$s1	array($t1)
	
	addu	$t0	$s0	$s1	# somo os ints
	sw	$s1	array($zero)	# shift <<
	sw	$t0	array($t1)
	j	fib_for_loop
	
end_fib_for_loop:
	lw 	$v0	array($t1)		# copio vet[2] p/ o return reg
	jr	$ra
