# Lista de Atividades — Estudo JavaScript (NodeJS)

**Disciplina:** Desenvolvimento Web Avançado  
**Objetivo:** Reforçar os conceitos básicos de JavaScript aplicados ao desenvolvimento back-end  

---

## Instruções

- Desenvolver os exercícios em Node.js  
- Utilizar `console.log()` para exibir resultados  
- Criar um único arquivo `lista_revisao.js` ou arquivos separados  
- Não utilizar bibliotecas externas  

---

1. Declare três variáveis: nome, idade e curso. Exiba uma frase com template string.

2. Dado um número, verifique se ele é:
   - positivo
   - negativo
   - zero

3. Crie um programa que calcule a média de três notas e informe:
   - aprovado (>= 7)
   - reprovado (< 7)

4. Verifique se uma pessoa pode dirigir considerando:
   - idade >= 18
   - possui carteira (true/false)

---

5. Crie um array com 5 números e exiba todos usando `for...of`.

6. Calcule a soma dos valores de um array manualmente (sem reduce).

7. Conte quantos números são pares em um array.

8. Dado um array de números, crie outro array contendo apenas os números maiores que 10.

---

9. Crie um objeto `produto` com:
   - nome
   - preço
   - quantidade  

Exiba o valor total em estoque.

---

10. Crie um array de objetos representando alunos:

```javascript
{ nome: "Ana", notas: [7,8,9] }
````

Exiba o nome de cada aluno.

---

11. Para cada aluno, calcule a média das notas.

---

12. Crie uma função tradicional que calcule a média de um array.

13. Reescreva a função usando arrow function.

14. Crie uma função que receba um produto e retorne:

* "estoque baixo" (quantidade < 5)
* "estoque ok"

---

15. Dado um array de números, utilize `map` para gerar o dobro de cada valor.

16. Utilize `filter` para retornar apenas números pares.

17. Utilize `reduce` para calcular a soma de um array.

---

18. Dado um array de produtos:

```javascript
{ nome: "Notebook", preco: 2000 }
```

Calcule o valor total usando `reduce`.

---

19. Dado um array de alunos:

```javascript
{ nome: "Ana", notas: [7,8,9] }
```

Crie um novo array contendo:

```javascript
{ nome: "Ana", media: X }
```

---

20. Filtre apenas alunos com média >= 7.

---

21. Gere uma lista apenas com os nomes dos aprovados.

---

22. Crie um sistema simples de produtos:

```javascript
{ nome, preco, quantidade }
```

O programa deve:

* exibir todos os produtos
* calcular valor total de cada produto
* identificar produtos com estoque baixo
* calcular valor total do estoque
* encontrar o produto mais caro

---

23. Dado um array de usuários:

```javascript
{ nome, idade, ativo }
```

O programa deve:

* listar usuários ativos
* contar quantos estão ativos
* calcular média de idade
* listar apenas maiores de idade

---

24. Crie um sistema de pedidos:

```javascript
{ cliente, total, status }
```

O programa deve:

* listar pedidos aprovados
* calcular total de vendas
* agrupar por cliente
* identificar cliente que mais comprou

---

## Dica importante

Se você não souber por onde começar:

1. Resolva com `for` primeiro
2. Depois refatore usando `map`, `filter` e `reduce`

---
