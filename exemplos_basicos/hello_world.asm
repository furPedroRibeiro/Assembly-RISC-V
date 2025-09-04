#rótulo		#diretiva
		.data 			#diretiva para inicio do seg de dados 
		.align 0		#alinha a memória para 2^n
str1: 		.asciz "Hello World! ++"
str2: 		.asciz "Hello World! --"
		
		.text			#diretiva para iniciar código de fato
		.align 2		#alinhando memória para 2^2(de 4 em 4 bytes) para as instruções(32 bits)
		.global main	 	#declarando que a label main pode ser utilizada em outros arquivos
main:
		addi a7, zero, 5	#configurando chamada para ler inteiro
		ecall
		add s0, zero, a0	#colocando a saída a0 em s0 para guardá-la
		blt s0,zero, print_neg
		addi a7, zero, 4
		la a0, str1
		ecall
		j end_program
print_neg: 
		addi a7, zero, 4
		la a0, str2
		ecall
end_program:
		