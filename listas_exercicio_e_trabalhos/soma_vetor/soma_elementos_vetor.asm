		.data
		.align 0
str_saida:	.asciz "A soma do vetor é: "
		.align 2
vetor: 		.word	10, 9, 8, 7, 6, 5, 4, 3, 2, 1	#uma word reserva 32 bits(4 bytes na memória pra gente
		.text
		.align 2				#as instruções tem 32 bits
		.global main
main: 
		la t1, vetor 				#carrega o endereço da primeira posição do vetor para t1
		addi t2, zero, 11			#condição de parada do loop
		addi t3, zero, 1			#contador do loop
		addi s0, zero, 0			#registrador para fazer a soma dos elementos do vetor
loop:   	beq t2, t3, sai_loop
		add s0, s0, t3
		addi t3, t3, 1
		j loop
sai_loop:
		la a0, str_saida			#coloca o endereço da string em a0
		addi a7, zero, 4 			#configura a7 para printar string
		ecall		
		add  a0, zero, s0 			#coloca o valor da soma em a0
		addi a7, zero, 1 			#configura a7 para printar inteiro
		ecall
		addi a7, zero, 10
		ecall