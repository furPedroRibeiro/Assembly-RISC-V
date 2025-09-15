		.data
		.align 0
str1:		.asciz "A CPU é composta por 3 principais componentes: "
str2:		.asciz "Unidade de Controle, ULA e os registradores, Von"
		.text
		.align 2
		.global main
main:		
		#vamos ler o tamanho das 2 strings e alocar um espaço dinâmico na memória para escrever as 2 combinadas
		addi s0, zero, 0	#aqui vai ficar o tamanho combinado
		#por convenção a0 e a1 são parâmetros de entrada de função
		la a0, str1
		jal str_len
		#por convenção a0 e a1 são parâmetros de entrada de função
		la a0, str2
		jal str_len
		#agora os tamanhos de str1 e str2 estão somados em s0
		addi s0, s0, 1 #adiciona o espaço do \0
		
		addi a7, zero, 9	#preparando a7 para fazer ecall de alocação dinâmica
		add a0, zero, s0	#jogando número de bytes pra a0
		ecall
		add s1, zero, a0	#salva o endereço inicial de strcat em s1
		add s2, zero, s1	#salva o endereço inicial de strcat
		#por convenção a0 e a1 são parâmetros de entrada de função
		add a0, zero, s1 	#a0 recebe o endereço da string cat
		la a1, str1	#a1 recebe o endereço da string 1
		jal strcat
		#por convenção a0 e a1 são parâmetros de entrada de função
		add a0, zero, s1 	#a0 recebe o endereço da string cat
		la a1, str2	#a1 recebe o endereço da string 1
		jal strcat
		
		sb zero, 0(s1)
		#vamos printar a string concatenada
		addi a7, zero, 4
		add a0, zero, s2
		ecall
		
		addi a7, zero, 10
		ecall
		
		
		
str_len:	#essa função vai incrementar o tamanho da string em s0
		lb t0, 0(a0)
		beq t0, zero, sai_str_len
		addi s0, s0, 1
		addi a0, a0, 1
		j str_len
		
sai_str_len:	jr ra

strcat: 	
		lb t0, 0(a1)
		beq t0, zero, sai_strcat
		sb t0, 0(a0)
		addi a1, a1, 1
		addi a0, a0, 1
		j strcat
		
sai_strcat:	
		add s1, zero, a0	#recebe onde parou 
		jr ra			#volta pra main