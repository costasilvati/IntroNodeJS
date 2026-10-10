# Atividade avaliativa

Desenvolva, em JavaScript executado com *node.js*, um programa capaz de
processar os dados de um pequeno sistema de controle de participantes de
um evento de tecnologia.

Seu programa deverá trabalhar com um conjunto de participantes
previamente definido no código.

1.  Cada participante deve ser representado por um objeto contendo, no
    mínimo, as seguintes informações: nome; idade; curso; presença no
    evento (true ou false); Uma lista com três notas correspondentes ao
    desempenho em desafios práticos realizados durante a oficina.

``` javascript
const participante = {
  nome: "Ana",
  idade: 25,
  curso: "BES",
  presenca: true,
  notas = [7, 9, 8.1]
};
```

2.  Você deve criar um array com pelo menos cinco participantes
    diferentes;

3.  A partir desses dados, o programa deverá exibir no terminal um
    relatório organizado com as seguintes informações:

    > nome e curso de cada participante;
    >
    > média das três notas de cada participante;
    >
    > situação de cada participante de acordo com a média, considerando
    > “aprovado” para média maior ou igual a 7 e “em recuperação” para
    > média menor que 7;
    >
    > indicação de maioridade, informando se o participante é maior ou
    > menor de idade;
    >
    > indicação de presença, informando se compareceu ou faltou ao
    > evento.

4.  Além disso, seu programa deverá calcular e exibir:

    > a quantidade total de participantes cadastrados;
    >
    > a quantidade de participantes presentes;
    >
    > a quantidade de participantes ausentes;
    >
    > a média geral das notas de todos os participantes;
    >
    > o nome do participante com maior média;
    >
    > e uma lista contendo apenas os nomes dos participantes aprovados.

5.  Implemente pelo menos uma função tradicional e pelo menos uma arrow
    function. Uma das funções deve ser responsável por calcular a média
    de um participante, e outra deve ser usada em algum processamento
    sobre arrays, como seleção, transformação ou agregação de dados.

    -   Sempre que fizer sentido, utilize template strings para montar
        as mensagens exibidas no terminal.
    -   Durante o desenvolvimento, evite repetir código
        desnecessariamente.
    -   Organize o programa de modo legível, com nomes claros para
        variáveis e funções.
    -   O uso de estruturas como for, for...of, if, operadores lógicos e
        métodos de array pode ser combinado conforme a sua estratégia de
        solução.

Ao final, entregue apenas o conteúdo (copie e cole o script) do arquivo
.js gerado, contendo todo o código-fonte. O programa deve executar sem
erros com o comando node script.js.

A avaliação considerará:

A)  o funcionamento correto do programa;

B)  o uso adequado dos conceitos básicos de JavaScript;

C)  a clareza da solução e a organização do código.

## Código resposta
O código da atividade está disponível na pasta de códigos do repositório de aula: [Para ver o código, clique AQUI](https://github.com/costasilvati/DesWebAvancado/blob/main/codigos/atividadde1/script.js)
