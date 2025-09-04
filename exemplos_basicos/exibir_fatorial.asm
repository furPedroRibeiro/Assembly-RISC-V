		.data
		.align 0
		#definindo strings para usar no programa
str_entrada:	.asciz "Digite um número:"
str_saida_1:	.asciz "O fatorial de "
str_saida_2:	.asciz " é: "
		
		#código começa aqui de fato
		.text
		.align 2
		.global main
main:		
		#primeiro devemos imprimir a string de entrada
		addi a7, zero, 4
		la a0, str_entrada
		ecall
		#agora vamos ler um número inteiro
		addi a7, zero, 5
		ecall
		#depois de ler o número inteiro, guardamos ele em s0
		add s0, zero, a0
		#vamos falar que o fatorial é igual a 1 setando s1 = 1
		addi s1, zero, 1
		#criando contador de n até 1
		add t0, s0, zero
		#registrador auxiliar da condição de parada
		addi t1, zero, 1
		#loop abaixo
loop:		ble t0, t1, sai_loop
		#pegamos o valor já setado do fatorial(1) e multiplicamos por n, e a cada loop, n é decrescido em 1.
		mul s1, s1, t0
		addi t0, t0, -1
		j loop
		#é importante salientar que o valor calculado do fatorial fica em s1
sai_loop: 
		#printando a string de saída 1
 		addi a7, zero, 4
		la a0, str_saida_1
		ecall
		#printar o numero de entrada guardado em s0
		addi a7, zero, 1
		add a0, zero, s0
		ecall
		#printar a string de saída 2
		addi a7, zero, 4
		la a0, str_saida_2
		ecall
		#printa o resultado do fatorial
		addi a7, zero, 1
		add a0, zero, s1
		ecall
		
		
		
		
		
		
		