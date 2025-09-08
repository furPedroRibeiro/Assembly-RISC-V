# Alocação dinâmica

- É o serviço 9 da ecall(sbrk)

---

### Parâmetro de entrada
**a0** -> número de bytes a serem reservados na heap
### Parâmetro de saída
**a0** -> endereço do 1° byte alocado

---

| DADOS      | Estático         | Código     |
| ---------- | ---------------- | ---------- |
| stack      | str_dst: 1 word  |
| heap       | str_src          |
