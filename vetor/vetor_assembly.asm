		.data
vetor:  	.word 9, 8, 7, 6, 5, 4, 3, 2, 1, 0

		.text
		la t1, vetor		#carrega o primeiro indice(endereço) do vetor pra t1
		addi t2, zero, 10 	#essa vai ser a condição de parada do loop
		addi t3, zero, 0	#esse vai ser o contador do loop
loop:		beq t2, t3, sai_loop	#se t2 = t3 sai do loop
		lw t0, 0(t1)		#carrega para t0 o valor de t1(posição do vetor)
		addi t3, t3, 1		#atualiza o contador fazendo contador++
		addi t1, t1, 4		#pula pra próxima pos do vetor (como é word, são 32 bits(4 bytes) para cada dado(int) na memória)
		j loop			#continua o loop
sai_loop: