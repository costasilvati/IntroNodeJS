const usuarios = [
  { nome: "Ana", idade: 20, ativo: true, compras: [100, 50, 25] },
  { nome: "Bruno", idade: 17, ativo: false, compras: [30, 20] },
  { nome: "Carlos", idade: 32, ativo: true, compras: [200, 150, 50, 100] },
  { nome: "Diana", idade: 25, ativo: true, compras: [] },
  { nome: "Eduardo", idade: 15, ativo: false, compras: [10] }
];

// Os usuário tem mais de 18 anos
const maiores = (u) => {
    if(u.idade >= 18){
        return u.nome;
    }
}

for(let usuario of usuarios){
    let maior = maiores(usuario);
    if(maior){
        console.log(maior);
    }
}

const numeros = [1,2,3,4,5,6];

const resultado = numeros
  .filter(n => n % 2 === 0)
  .map(n => n * 2)
  .reduce((acc, n) => acc + n, 0);

console.log(resultado);