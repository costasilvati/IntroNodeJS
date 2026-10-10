let nome = "Carlos";
let idade = 30.9;
let ativo = true;

console.log(typeof nome);
console.log(typeof idade);
console.log(typeof ativo);

// Operadores relacionais
let x = 10;
let y = "10";

console.log(x == y);
console.log(x === y); // false devido ao tipo

// Repetição
console.log("FOR")
let numeros = [1, 5, 3, 9];

for(let n of numeros){
    console.log(n);
}
// Se for necessário identificar o index do array
console.log("FOR 2")
for(let i = 0; i< numeros.length; i++){
    console.log(numeros[i]);
}

// Funções JS
function soma(a, b){
    return a+b;
}

console.log(soma(2, 8));
console.log(soma("iua ", 8));
console.log(soma(1.9, 2));

const soma2 = (a, b) => {
    return a+b;
};


//Executar:
// Abra o terminal e digite: node meu_arquivo.js