		.data
		.align 0
str1:		.asciz "Oi geladinhoooooooooooooo"
str2:		.asciz "Texto 1, será que é igua"
str_saida_1:	.asciz "As string são: iguais"
str_saida_2: 	.asciz "As string são: diferentes"
		.text
		.align 2
		.global main
main: 		
		#é convenção usar a1 e a0 como entradas de função
		la a0, str1	#colocando endereço da string 1 em a0
		la a1, str2	#colocando endereço da string 2 em a1
		jal strcmp
		
strs_diferentes: 
		addi a7, zero, 4
		la a0, str_saida_2
		ecall
		#encerra o programa
		addi a7, zero, 10
		ecall
strs_iguais:		
		addi a7, zero, 4
		la a0, str_saida_1
		ecall
		#encerra o programa
		addi a7, zero, 10
		ecall
strcmp:		
		lb t0, 0(a0)			#carrega o byte 0 em relação a string 1
		lb t1, 0(a1)			#carrega o byte 0 em relação a string 2
		bne t0, t1, strs_diferentes	#vê se os bytes são diferentes
		#a execução só chegara aqui se as strings forem iguais até o momento, se não o programa já será encerrado na label strs_diferentes
		beq t0, zero, cmp_zero_str2	#vê se a string 1 acabou, se ela acabou ele vai verificar se a outra também acabou
		beq t1, zero, cmp_zero_str1	#vê se a string 2 acabou, se ela acabou ele vai verificar se a outra também acabou
		#se os bytes não são diferentes e as strings não acabaram
		addi a0, a0, 1			#incrementa a0
		addi a1, a1, 1			#incrementa a1
		j strcmp			
		
cmp_zero_str2: 	#essa label verifica se a string 2 também acabou, se sim elas são iguais
		lb t1, 0(a1)
		beq t1, zero, strs_iguais	#se a string 2 acabou elas são iguais
		#se a string 2 não acabou, elas são diferentes
		j strs_diferentes
cmp_zero_str1: 	#essa label verifica se a string 1 também acabou, se sim elas são iguais
		lb t0, 0(a0)
		beq t0, zero, strs_iguais	#se a string 1 acabou elas são iguais
		#se a string 1 não acabou, elas são diferentes
		j strs_diferentes		