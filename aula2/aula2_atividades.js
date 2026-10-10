const usuarios = [
  { nome: "Ana", idade: 20, ativo: true, compras: [100, 50, 25] },
  { nome: "Bruno", idade: 17, ativo: false, compras: [30, 20] },
  { nome: "Carlos", idade: 32, ativo: true, compras: [200, 150, 50, 100] },
  { nome: "Diana", idade: 25, ativo: true, compras: [] },
  { nome: "Eduardo", idade: 15, ativo: false, compras: [10] }
];

//Utilizando arrow functions, calcule o valor total de compras de cada usuário.
// Resultado esperado:

// Ana: total = 175
// Bruno: total = 50
// Carlos: total = 500
// Diana: total = 0
// Eduardo: total = 10

const total = (users) =>{
    let totais = []
    for(let u of users){
        let soma = 0
        for(let item of u.compras){
            soma+=item
        }
        totais.push({nome: u.nome, total: soma})
        console.log(u.nome +": total = "+ soma)
        
    }
}

total(usuarios)

// Parte 2 — Usuários Ativos
// Utilizando arrow functions, filtre apenas os usuários que estão ativos.

// Resultado esperado:

// Ana
// Carlos
// Diana

const ativos = 

// Parte 3 — Usuários Maiores de Idade
// Liste apenas usuários com idade >= 18.

// Utilize arrow functions.

// Parte 4 — Usuário com Maior Volume de Compras
// Determine qual usuário possui o maior total de compras.

// Resultado esperado (aproximado):

// Usuário com maior volume: Carlos
// Total: 500