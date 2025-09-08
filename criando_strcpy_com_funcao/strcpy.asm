		.data
		.align 0
str_src: 	.asciz "Hello World!!"
str_dst:	.space 14			#separando 18 bytes na memória(é evidente que as strings precisam ter o mesmo tamanho)
		
		.text
		.align 2
		.global main
main:
		#é convenção usar a0 e a1 para parâmetros de função
		la a0, str_src			#carrega endereço da string de entrada pra a0
		la a1, str_dst  		#carrega endereço da string de destino pra a1
		jal strcpy			#chama a função strcpy, o ra fica a próxima instrução aqui da main
		
		addi a7, zero, 4		#setando a7 para printar string
		la a0, str_dst			#carregando o endereço da string de destino para a0
		ecall				#ecall para printar o conteúdo de a0 na tela
		
		#encerra o programa
		addi a7, zero, 10
		ecall

strcpy: 
	strcpy_loop:	
		lb t0, 0(a0)			#carrega para t0 o dado de 0 em relação a a0
		sb t0, 0(a1)			#carrega para 0 em relação a a1 o dado que está em t0
		addi a0, a0, 1			#atualiza a0 para o endereço do próximo caracter(byte)
		addi a1, a1, 1			#atualiza a1 para o endereço do próximo caracter(byte)
		bne t0, zero, strcpy_loop	#se o caracter que está em t0 for diferente de zero, voltamos para copiar o próximo caracter de uma string pra outra
		jr ra 				#volta pra main
		
		
		
		