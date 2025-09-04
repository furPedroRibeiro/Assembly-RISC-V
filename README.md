# RISC-V Reference - Syscalls e Registradores



## 1. Syscalls RARS (RISC-V)

| a7 | Syscall              | Entrada (registradores)             | Saída             |
| -- | -------------------- | ----------------------------------- | ----------------- |
| 1  | Print integer        | a0 = inteiro                        | -                 |
| 2  | Print float          | fa0 = float                         | -                 |
| 3  | Print double         | fa0 = double                        | -                 |
| 4  | Print string         | a0 = endereço da string             | -                 |
| 5  | Read integer         | -                                   | valor lido em a0  |
| 6  | Read float           | -                                   | valor lido em fa0 |
| 7  | Read double          | -                                   | valor lido em fa0 |
| 8  | Read string          | a0 = endereço, a1 = tamanho         | string em memória |
| 9  | Sbrk (aloca memória) | a0 = nº de bytes                    | endereço em a0    |
| 10 | Exit                 | -                                   | encerra programa  |
| 11 | Print char           | a0 = caractere (int)                | -                 |
| 12 | Read char            | -                                   | caractere em a0   |
| 13 | Open file            | a0 = nome, a1 = flags, a2 = mode    | descritor em a0   |
| 14 | Read file            | a0 = descritor, a1 = buffer, a2 = n | nº bytes lidos    |
| 15 | Write file           | a0 = descritor, a1 = buffer, a2 = n | nº bytes escritos |
| 16 | Close file           | a0 = descritor                      | -                 |



---



## 2. Registradores Inteiros RISC-V (32I ABI)

| Nome   | Número  | Descrição                                 | Observações                                                                   |
| ------ | ------- | ----------------------------------------- | ----------------------------------------------------------------------------- |
| zero   | x0      | Sempre 0 (constante)                      | -                                                                             |
| ra     | x1      | Return address                            | Endereço de retorno de função; preservado automaticamente                     |
| sp     | x2      | Stack pointer                             | Aponta para o topo da pilha; usado para salvar temporários e variáveis locais |
| gp     | x3      | Global pointer                            | Aponta para a região de dados globais                                         |
| tp     | x4      | Thread pointer                            | Usado em programas multithread para dados específicos de cada thread          |
| t0–t2  | x5–x7   | Temporários (não preservados)             | Podem ser sobrescritos; não precisam ser salvos                               |
| s0/fp  | x8      | Saved register / frame pointer            | Preservado; deve manter valor após chamadas de função                         |
| s1     | x9      | Saved register                            | Preservado; útil para variáveis que persistem entre chamadas                  |
| a0–a1  | x10–x11 | Argumentos de função + valores de retorno | Usados para passar parâmetros ou retornar valores                             |
| a2–a7  | x12–x17 | Argumentos de função                      | Apenas para passagem de parâmetros; podem ser sobrescritos                    |
| s2–s11 | x18–x27 | Saved registers (preservados)             | Devem ser salvos/restaurados se usados                                        |
| t3–t6  | x28–x31 | Temporários                               | Não preservados entre chamadas; valores podem ser sobrescritos                |



### Registradores de ponto flutuante

| Nome     | Descrição                       | Observações                                 |
| -------- | ------------------------------- | ------------------------------------------- |
| fa0–fa7  | Argumentos/retorno float/double | Passagem de parâmetros e valores de retorno |
| ft0–ft11 | Temporários float               | Não preservados entre chamadas              |
| fs0–fs11 | Saved registers float           | Preservados; devem ser salvos/restaurados   |

---



**Resumo:**

- **Preservados (saved registers)**: mantêm seus valores após chamadas de função; usados para variáveis que precisam persistir.

- **Temporários (t0–t6, ft0–ft11)**: podem ser sobrescritos por funções; não precisam ser salvos.

- **Argumentos/retorno (a0–a7, fa0–fa7)**: usados para passar dados entre funções ou receber resultados.

- **zero** = 0 constante, **sp** = ponteiro da pilha, **ra** = endereço de retorno.

- **Syscalls**: controladas pelo registrador `a7`, com argumentos em `a0, a1...`.





