# Copa da API Finanças: roteiro de estudo {#copa-api-financas}

**Disciplina:** Desenvolvimento Web Back-end (Node.js) — Engenharia de Software
**Atividade:** jogo em sala, em equipe, sobre o Projeto 2 (API de Controle Financeiro)
**Formato:** estudo em casa (1 semana) + torneio em sala (90 min)
**Equipes:** as mesmas do Projeto 2 (3 integrantes; a equipe com 2 integrantes segue a regra da Seção \@ref(copa-sorteio))
**Material de referência:** [descrição do Projeto 2](https://costasilvati.github.io/IntroNodeJS/projeto-api-financas.html), especialmente as seções 4 (requisitos funcionais), 6 (entidades), 7 (padrão de respostas), 8 (estrutura) e 13 (checklist final)

---

## Por que esta atividade?

O Projeto 2 é avaliado também por uma **apresentação em que todos os integrantes precisam explicar o código** (critério E.16). A Copa é um ensaio em formato de jogo: ela cobra exatamente as regras que mais derrubam nota no projeto (códigos de status, isolamento entre usuários, parcelamento em centavos, previsão de faturas, segurança da senha e do token) e faz isso de modo que **cada integrante responda sozinho** em algum momento.

> **Atenção:** quem responde em cada pergunta é definido por sorteio ou rodízio na hora. Não adianta a equipe ter "a pessoa que sabe tudo": todos precisam estudar.

---

## Como funciona o jogo {#copa-regras}

### O sorteio de quem responde {#copa-sorteio}

No início da aula, cada integrante recebe um número: **1, 2 ou 3**. Em cada pergunta, o slide (ou o dado da professora) indica qual número responde. Esse integrante responde **sem ajuda** da equipe; conversar com o colega durante a resposta anula o ponto.

- **Equipe com 2 integrantes:** quando o número sorteado for 3, a própria equipe escolhe quem responde.
- **Integrante ausente:** quando o número dele for sorteado, a equipe escolhe quem responde, mas a pergunta vale metade dos pontos.

### As quatro rodadas

| Rodada | Nome | Formato | Pontos |
|---|---|---|---|
| 1 | **Status relâmpago** | Kahoot com 12 perguntas, 1 celular por equipe; cada pergunta indica o integrante que responde | 1 por acerto (máx. 12) |
| 2 | **Caça ao bug** | Envelope com 4 trechos de código do projeto, cada um com um erro; 4 min por trecho | 0, 1 ou 2 por trecho (máx. 8) |
| 3 | **Fatura relâmpago** | 4 casos de parcelamento no cartão; todas as equipes mostram a resposta ao mesmo tempo | 0, 1 ou 2 por caso (máx. 8) + bônus de explicação |
| 4 | **Aposta final** | Uma pergunta conceitual; a equipe aposta até metade dos pontos que tem | ± valor apostado |

**Bônus da carta-bug:** +2 pontos para cada equipe cuja carta-bug (Seção \@ref(copa-carta-bug)) for usada no jogo.

---

## O que estudar {#copa-estudo}

Use a descrição do projeto e o código que a sua equipe já escreveu. Para cada tópico abaixo há um **treino**; resolvam em equipe e confiram o gabarito no final do roteiro (Seção \@ref(copa-gabarito-treino)).

### Rodada 1: códigos de status e regras gerais

O projeto define um padrão único de respostas (seção 7 da descrição). Memorize **quando** usar cada código — e, principalmente, as situações que costumam gerar dúvida.

Table: (\#tab:copa-status) Códigos de status do Projeto 2

| Código | Significado | Situações no projeto |
|---|---|---|
| 200 | OK | Consultas, atualizações e login |
| 201 | Created | Criação de usuário, categoria, fonte/destino e lançamento |
| 204 | No Content | Exclusão bem-sucedida, **sem corpo** |
| 400 | Bad Request | Campo ausente, formato inválido, regra de negócio violada |
| 401 | Unauthorized | Token ausente, inválido ou expirado; login com credenciais erradas |
| 404 | Not Found | Registro inexistente **ou de outro usuário**; rota inexistente |
| 409 | Conflict | E-mail/CPF duplicado, nome repetido, exclusão com vínculos |
| 500 | Internal Server Error | Erro inesperado (detalhe só no log do servidor) |

Pontos de atenção:

- **401 × 404 × 403.** O projeto não usa 403 para "registro de outro usuário": a resposta é **404**, porque um 403 confirmaria que o registro existe.
- **Normalização.** E-mail é gravado em minúsculas e sem espaços; CPF só com dígitos. Por isso `Ana@Email.com` e `ana@email.com` são o **mesmo** e-mail (409).
- **De onde vem o id do usuário?** Sempre do token (`req.auth.id`), nunca do corpo, da URL ou da query string (RF3).
- **Senha.** Gravada com `bcrypt.hash` e conferida com `bcrypt.compare`. O campo `senha_hash` **nunca** aparece em uma resposta.
- **Token.** Assinado com `jsonwebtoken`, chave no `.env` (`JWT_SECRET`), validade de 1 hora (`expiresIn: '1h'`); rotas protegidas com `express-jwt`.
- **Organização.** SQL só em `models/`; consultas sempre parametrizadas com `?`; rotas com `express.Router()`; módulos em CommonJS.

**Treino 1.** Escreva o código de status de cada situação:

a) `POST /categorias` com um nome que o usuário já tem para o mesmo tipo.
b) `PUT /fontes-destinos/12` com `tipo: "poupanca"`.
c) `GET /relatorios/categorias` sem `inicio` e `fim`.
d) `POST /auth/login` com a senha errada.
e) `GET /rota-que-nao-existe`.
f) `POST /lancamentos` válido.

### Rodada 2: caça ao bug

Na Rodada 2 a equipe recebe trechos de código **parecidos com os do projeto**, cada um com **um erro principal**. Para cada trecho, a folha de respostas pede: **(1)** a linha ou o trecho com erro, **(2)** a regra do projeto que foi violada e **(3)** a correção.

Os erros sorteados vêm desta lista (todos estão no checklist da seção 13 ou nos requisitos):

- consulta que não filtra pelo dono (`usuario_id`) — **isolamento** (RF3);
- resposta que devolve o `senha_hash`;
- SQL montado com *template string* ou concatenação, em vez de `?`;
- SQL fora de `models/`;
- parcelamento que não fecha o valor exato (divisão sem centavos);
- `DECIMAL`/`SUM` usado como número sem `Number()` (chega como texto no `mysql2`);
- lançamento de **saída** aceitando categoria de **entrada**;
- e-mail ou CPF sem normalização, ou duplicidade checada só com `SELECT`, sem `UNIQUE` no banco;
- rota protegida sem o middleware `protegerRota`, ou chave do JWT escrita no código;
- falta de `return` depois de uma resposta de erro (duas respostas para a mesma requisição).

**Treino 2.** Encontre o erro, diga a regra violada e corrija:

```javascript
// routes/fontesDestinos.js
router.delete('/:id', async (req, res) => {
  const [r] = await db.query(
    `DELETE FROM fontes_destinos WHERE id = ${req.params.id} AND usuario_id = ${req.auth.id}`
  );
  if (r.affectedRows === 0) {
    res.status(404).json({ erro: 'Fonte/destino não encontrada.' });
  }
  res.status(204).end();
});
```

> Dica: este trecho tem **três** problemas. Na Rodada 2, cada trecho tem um erro principal, e a resposta precisa acertá-lo para valer 2 pontos.

### Rodada 3: parcelas e faturas

#### Divisão das parcelas em centavos (RF6)

Dinheiro não pode ser dividido em ponto flutuante e arredondado parcela a parcela. O jeito correto é trabalhar em **centavos inteiros** e colocar a diferença na **primeira** parcela:

```javascript
// utils/parcelas.js
function dividirEmParcelas(valor, n) {
  const totalCentavos = Math.round(valor * 100);
  const base = Math.floor(totalCentavos / n);
  const resto = totalCentavos - base * n;          // 0 ≤ resto < n
  return Array.from({ length: n }, (_, i) =>
    (i === 0 ? base + resto : base) / 100
  );
}

module.exports = { dividirEmParcelas };
```

A soma das parcelas tem de ser **exatamente** o valor da compra (item do checklist: "R$ 100,00 em 3× soma exatamente R$ 100,00").

**Treino 3.** Quais são as parcelas de R$ 250,00 em 7×? Confira que a soma dá R$ 250,00.

#### Em qual fatura cai cada parcela? (RF9)

A regra completa está no RF9. Resumo, passo a passo:

1. **Mês de fechamento da 1ª parcela.** Compra **antes** do dia de fechamento entra na fatura que fecha no **mesmo mês**; compra **no dia** do fechamento **ou depois** entra na fatura do **mês seguinte**.
2. **Demais parcelas.** A parcela *k* cai *k − 1* meses depois da primeira.
3. **Vencimento.** Se o dia de vencimento for **maior** que o de fechamento, a fatura vence no **mesmo mês** do fechamento; senão, vence no **mês seguinte**.
4. **Referência.** É o mês do **vencimento**, no formato `AAAA-MM`.
5. **Dias que não existem** (por exemplo, dia 30 em fevereiro) viram o **último dia** do mês.

**Exemplo resolvido.** Cartão com fechamento no dia 15 e vencimento no dia 22; compra de R$ 90,00 em 3× em 12/05/2026.

| Parcela | Valor | Fechamento | Vencimento | Referência | Por quê |
|---|---|---|---|---|---|
| 1/3 | R$ 30,00 | 15/05/2026 | 22/05/2026 | 2026-05 | dia 12 < 15 → mesmo mês; 22 > 15 → vence no mesmo mês |
| 2/3 | R$ 30,00 | 15/06/2026 | 22/06/2026 | 2026-06 | 1 mês depois |
| 3/3 | R$ 30,00 | 15/07/2026 | 22/07/2026 | 2026-07 | 2 meses depois |

**Limite do cartão.** Limite utilizado = soma das parcelas cuja fatura **ainda não venceu**; limite disponível = limite total − limite utilizado.

**Treino 4.** Cartão com fechamento no dia 18 e vencimento no dia 3; compra de R$ 250,00 em 2× em 18/08/2026. Monte a tabela (valor, fechamento, vencimento e referência de cada parcela).

**Treino 5.** Cartão com fechamento no dia 31 e vencimento no dia 8; compra de R$ 120,00 em 2× em 31/01/2026. Cuidado com fevereiro.

### Rodada 4: aposta final

A pergunta final é **conceitual**: a equipe precisa explicar o **porquê** de uma decisão do projeto, citando os comandos ou recursos envolvidos. Estudem em especial:

- por que o **cadastro usa transação** e o que acontece se uma das inserções falhar (`beginTransaction`, `commit`, `rollback`; com pool, a transação usa uma conexão obtida por `pool.getConnection`);
- por que a duplicidade de e-mail/CPF deve ser garantida pelo **banco** (`UNIQUE`) e não apenas por um `SELECT` antes do `INSERT`;
- por que o registro de outro usuário responde **404** e não 403;
- por que os totais dos relatórios são calculados em SQL (`SUM`/`GROUP BY`) e convertidos com `Number()`.

**Treino 6.** Expliquem, em até 4 linhas, por que `UNIQUE` no banco é necessário mesmo que a rota faça um `SELECT` antes de inserir.

---

## Carta-bug: a contribuição da equipe {#copa-carta-bug}

Cada equipe deve enviar **uma carta-bug** pelo Moodle **até a véspera da aula**. As melhores cartas entram na Rodada 2 e valem **+2 pontos** para a equipe autora.

**O que enviar:**

1. Um trecho de **6 a 15 linhas** de código no estilo do projeto (Express, `mysql2`, JWT), com **um** erro ligado a uma regra do Projeto 2.
2. A **resposta**: linha do erro, regra violada (cite o RF ou o item do checklist) e o código corrigido.

**Regras:**

- O erro precisa ser de **regra do projeto** (status, isolamento, segurança, validação, centavos, faturas, organização), não de digitação.
- O trecho não pode ser cópia literal do código de outra equipe.
- Cartas muito parecidas com as da professora ou de outra equipe não pontuam.

**Modelo:**

````markdown
**Equipe:** Equipe 07
**Arquivo:** routes/categorias.js

```javascript
// trecho com o erro
```

**Erro (linha):** ...
**Regra violada:** RF... / item do checklist ...
**Correção:**

```javascript
// trecho corrigido
```
````

---

## Checklist da equipe antes da aula

- [ ] Todos sabem o código de status de cada situação da Tabela \@ref(tab:copa-status).
- [ ] Todos explicam por que o id do usuário vem de `req.auth.id` e por que outro usuário recebe 404.
- [ ] Todos sabem calcular as parcelas em centavos e a fatura de cada parcela.
- [ ] Todos sabem por que o `senha_hash` não pode sair na resposta e onde fica a chave do JWT.
- [ ] A equipe resolveu os seis treinos e conferiu o gabarito.
- [ ] A carta-bug foi enviada pelo Moodle.
- [ ] Pelo menos um celular por equipe com o aplicativo ou o site do Kahoot funcionando.

---

## Gabarito dos treinos {#copa-gabarito-treino}

**Treino 1.** a) 409; b) 400 (`tipo` deve ser `renda`, `conta` ou `cartao_credito`); c) 400; d) 401, com mensagem genérica; e) 404, em JSON; f) 201.

**Treino 2.**

1. **SQL montado com *template string*** (regra: consultas parametrizadas com `?`), o que permite injeção de SQL.
2. **SQL dentro de `routes/`** (regra: SQL só em `models/`).
3. **Falta de `return`** depois do 404: a execução continua até o `res.status(204)` e o Express tenta responder duas vezes (`ERR_HTTP_HEADERS_SENT`).

```javascript
// models/FonteDestino.js
static async excluir(id, usuarioId) {
  const [r] = await db.query(
    'DELETE FROM fontes_destinos WHERE id = ? AND usuario_id = ?',
    [id, usuarioId]
  );
  return r.affectedRows > 0;
}

// routes/fontesDestinos.js
router.delete('/:id', async (req, res) => {
  const excluiu = await FonteDestino.excluir(req.params.id, req.auth.id);
  if (!excluiu) {
    return res.status(404).json({ erro: 'Fonte/destino não encontrada.' });
  }
  res.status(204).end();
});
```

(No projeto completo, a exclusão também precisa verificar lançamentos vinculados e responder 409.)

**Treino 3.** 25.000 centavos ÷ 7 = 3.571 centavos, com resto 3. Parcelas: R$ 35,74 + 6 × R$ 35,71 = R$ 250,00.

**Treino 4.**

| Parcela | Valor | Fechamento | Vencimento | Referência |
|---|---|---|---|---|
| 1/2 | R$ 125,00 | 18/09/2026 | 03/10/2026 | 2026-10 |
| 2/2 | R$ 125,00 | 18/10/2026 | 03/11/2026 | 2026-11 |

A compra foi **no dia** do fechamento, então a 1ª parcela vai para o fechamento do mês seguinte (setembro); como o vencimento (3) é menor que o fechamento (18), a fatura vence no mês seguinte ao fechamento.

**Treino 5.**

| Parcela | Valor | Fechamento | Vencimento | Referência |
|---|---|---|---|---|
| 1/2 | R$ 60,00 | 28/02/2026 | 08/03/2026 | 2026-03 |
| 2/2 | R$ 60,00 | 31/03/2026 | 08/04/2026 | 2026-04 |

A compra foi no dia 31, que é o dia do fechamento, então vai para fevereiro; fevereiro de 2026 não tem dia 31, então o fechamento é no último dia (28/02).

**Treino 6.** Duas requisições simultâneas podem fazer o `SELECT` ao mesmo tempo, ambas não encontram o e-mail e ambas inserem: o resultado é um e-mail duplicado (condição de corrida). A restrição `UNIQUE` faz o próprio banco recusar o segundo `INSERT` (erro `ER_DUP_ENTRY`), que a API converte em 409.
