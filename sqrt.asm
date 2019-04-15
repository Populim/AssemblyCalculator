# Para se calcular a raiz de um n�mero N, foi utilizado o m�todo de Newton-Raphson, uma f�rmula de recorr�ncia que se aproxima do valor desejado
# em ordem quadr�tica. O valor inicial da recorr�ncia pode ser qualquer um, e nesse programa foi utilizado o pr�prio N.
	
	.data:
dig_sqrt_str:	.asciiz	"Digite um n�mero para se calcular sua raiz\n"
sqrt_str:	.asciiz "A raiz do n�mero digitado � "
barra_n:	.asciiz "\n"
double_dois: 	.double 2.0

	.text:
.globl	rotina_sqrt



rotina_sqrt:
	li	$v0	4
	la	$a0	dig_sqrt_str
	syscall

	li	$v0	7	# l� o n�mero digitado(N) em f0
	syscall
	
	mov.d 	$f2 	$f0	# Armazena-se N em $f2
	
	mov.d	$f4	$f0	# Armazena-se o valor inicial em $f4
	
	l.d	$f8	double_dois
	
loop_sqrt:

	mul.d 	$f6	$f4	$f4
	sub.d	$f6	$f6	$f2
	
	div.d	$f6	$f6	$f4
	div.d	$f6	$f6	$f8
	
	
	sub.d 	$f6	$f4	$f6
	
	c.eq.d	$f6	$f4
	bc1t	end_loop_sqrt		
	
	mov.d	$f4	$f6
	
	j	loop_sqrt

end_loop_sqrt:
	
	li	$v0	4
	la	$a0	sqrt_str
	syscall
	
	li	$v0	3
	mov.d	$f12	$f4
	syscall
	
	li	$v0	4
	la	$a0	barra_n
	syscall

	j	menu_principal