# Lista de Exercícios --- JavaScript (Back-end / Node.js)

**Disciplina:** Desenvolvimento Web Avançado\
**Tema:** Variáveis, Tipos, Operadores e Laços de Repetição\
**Execução:** Node.js (terminal)

------------------------------------------------------------------------

## Instruções gerais

1.  Crie uma pasta chamada `lista-js-01`.
2.  Para cada exercício crie um arquivo:

```{=html}
<!-- -->
```
    ex01.js
    ex02.js
    ex03.js
    ...

3.  Execute no terminal:

```{=html}
<!-- -->
```
    node ex01.js

4.  Utilize `console.log()` para exibir resultados.

Opcional: caso queira ler dados do usuário, utilize o módulo `readline`
do Node.js.

------------------------------------------------------------------------

# Parte A --- Variáveis e Tipos

## Exercício 1 --- Declaração de variáveis

Declare as variáveis:

    nome
    idade
    cidade

Exiba no console:

    Meu nome é <nome>, tenho <idade> anos e moro em <cidade>.

------------------------------------------------------------------------

## Exercício 2 --- Informações de produto

Declare:

    produto
    preco
    quantidade

Calcule o valor total do estoque.

Exiba:

    Produto: X
    Preço: Y
    Quantidade: Z
    Total em estoque: W

------------------------------------------------------------------------

## Exercício 3 --- Conversão de tipos

Crie as variáveis:

    let numero = "25"
    let preco = "19.90"

Converta para `number` e exiba:

-   valor convertido
-   tipo usando `typeof`

------------------------------------------------------------------------

## Exercício 4 --- Operadores matemáticos

Utilize duas variáveis:

    let a = 15
    let b = 4

Calcule:

-   soma
-   subtração
-   multiplicação
-   divisão
-   resto da divisão
-   potência

Exiba todos os resultados.

------------------------------------------------------------------------

# Parte B --- Operadores Relacionais e Lógicos

## Exercício 5 --- Comparações

Crie duas variáveis:

    let x = 10
    let y = "10"

Exiba o resultado de:

    x == y
    x === y
    x != y
    x !== y
    x > 5
    y >= 10

------------------------------------------------------------------------

## Exercício 6 --- Validação de idade

Crie uma variável `idade`.

Utilize operadores relacionais para verificar:

-   menor que 18
-   entre 18 e 60
-   maior que 60

Exiba a categoria correspondente.

------------------------------------------------------------------------

## Exercício 7 --- Acesso ao sistema

Crie as variáveis:

    usuario = "admin"
    senha = "1234"

Utilize operadores lógicos para verificar se o login é válido.

Exiba:

    Acesso permitido
    ou
    Acesso negado

------------------------------------------------------------------------

# Parte C --- Laços de repetição

## Exercício 8 --- Soma de números

Utilize um `for` para calcular a soma de números de **1 até 100**.

Exiba o resultado.

------------------------------------------------------------------------

## Exercício 9 --- Tabuada

Crie um programa que exiba a tabuada de um número.

Exemplo para `5`:

    5 x 1 = 5
    5 x 2 = 10
    ...
    5 x 10 = 50

------------------------------------------------------------------------

## Exercício 10 --- Contador de pares e ímpares

Crie um laço que percorra os números de **1 até 50**.

Conte:

-   quantos são pares
-   quantos são ímpares

Exiba os resultados.

------------------------------------------------------------------------

## Exercício 11 --- Média de valores

Dado o array:

    let numeros = [10, 5, 8, 20, 15]

Calcule usando laço:

-   soma
-   média

------------------------------------------------------------------------

# Parte D --- Exercícios Desafiadores

## Exercício 12 --- Estatísticas de um array

Dado:

    let valores = [12, 7, 25, 3, 18, 10, 2, 30]

Calcule:

-   maior valor
-   menor valor
-   média
-   quantidade de números maiores que 10

------------------------------------------------------------------------

## Exercício 13 --- Números primos

Escreva um programa que identifique todos os números **primos entre 1 e
100**.

------------------------------------------------------------------------

## Exercício 14 --- FizzBuzz

Crie um programa que percorra números de **1 a 50**.

Regras:

-   múltiplo de 3 → `"Fizz"`
-   múltiplo de 5 → `"Buzz"`
-   múltiplo de ambos → `"FizzBuzz"`
-   caso contrário → número

------------------------------------------------------------------------

## Exercício 15 --- Análise de requisições (simulação back-end)

Dado:

    let requests = [12, 30, 5, 18, 40, 22, 8]
    let limite = 25

Para cada valor:

-   se `requests <= limite` → `"OK"`
-   se `requests > limite` → `"LIMIT EXCEEDED"`

Ao final exiba:

-   total de requisições válidas
-   total acima do limite
-   maior valor encontrado

------------------------------------------------------------------------

# Entrega

Enviar:

-  link do repositório GitHub contendo os exercícios.
