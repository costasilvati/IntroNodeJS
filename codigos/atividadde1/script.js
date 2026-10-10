let participantes = [
    {nome: "Juliana Costa", idade: 38, curso: "ADS", presenca: true, notas: [9.5, 7.0, 6.0]},
    {nome: "José da Silva", idade: 19, curso: "BES", presenca: true, notas: [4.5, 5.0, 6.0]},
    {nome: "Marcos Roger", idade: 17, curso: "BES", presenca: false, notas: [9.5, 9.0, 8.0]},
    {nome: "Sandra Souza", idade: 25, curso: "BES", presenca: true, notas: [0.0, 1.0, 0.0]},
    {nome: "Ricardo Silva", idade: 22, curso: "ADS", presenca: true, notas: [7.5, 7.0, 7.0]},
]

const media = (notas) =>{
    let media = notas.reduce((valorAcumulado, n)=>valorAcumulado+n, 0)/ notas.length;
    return media;
}

const maiorMedia = (participantes) => {
    let maiorMedia = 0;
    let n = "";
    for(let p of participantes){
        let mTemp = media(p.notas);
        if(maiorMedia ==0){
            maiorMedia = mTemp;
            n = p.nome;
        }else if(mTemp > maiorMedia){
            maiorMedia = mTemp;
            n = p.nome;
        }
    }
    return {nome: n, media: maiorMedia};
}

const mediaGeral = (participantes) => {
    let sumAverage = 0;
    for(let p of participantes){
        sumAverage += media(p.notas);
    }
    return (sumAverage/ participantes.length);
}

const resultado = (a) => {
    let m = media(a.notas);
    let res = "--";
    if(m >= 7.0){
        res = "Aprovado";
    }else{
        res = "Recuperação"
    }
    return res;
}

/*
const aprovados = (participantes) =>{
    let ap = participantes.filter(p => p.situacao == "Aprovado")
}
*/

/*
C - Create
R - Reade
U - Update
D - Delete
*/

const aprovados = (participantes) => {
    let ap = [];
    for(let p of participantes){
        let r = resultado(p);
        if(r === "Aprovado"){
            ap.push(p.nome);
        }
    }
    return ap;
}

let somaMedias = 0.0;

console.log("------------------------------------------------------------------------------------")
console.log("| ALUNO  \t  |CURSO  | MÉDIA    \t | SITUAÇÃO    \t | MAIOR \t| PRESENTE |")
console.log("|-----------------|-------|--------------|---------------|--------------|----------| ")
for(let aluno of participantes){
    let maioridade = false;
    if(aluno.idade >= 18){
        maioridade = true;
    }
    console.log("| "+ aluno.nome+"\t  |"+ aluno.curso + "\t  | " + media(aluno.notas).toFixed(2) + "\t |"+ resultado(aluno) + " \t | "+ maioridade + " \t| "+aluno.presenca + "\t |");
}
console.log("------------------------------------------------------------------------------------\n")

// Total de participantes
let presentes = participantes.filter(a => a.presenca == true)
console.log("Total de participantes cadastrados: "+ participantes.length);
console.log("Total de participantes presentes: "+ presentes.length);
console.log("Total de participantes ausenttes: "+ (participantes.length - presentes.length));
console.log("Media Geral de notas: "+ mediaGeral(participantes).toFixed(2));
console.log("Participante com maior média: "+ maiorMedia(participantes).nome);
console.log("Nomes dos participantes aprovados: " + aprovados(participantes));