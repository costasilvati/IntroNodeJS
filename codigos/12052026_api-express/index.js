const express = require('express');

const app = express();

app.use(express.json());

app.get('/',(req, res) =>{
    res.send("Página inicial da aplicação.");
});

app.get('/carros', (req, res) =>{
    const carro = {
        nome: "Fusca",
        ano: 1995
    }
    res.status(200).json(carro);
});

app.get('/usuarios', (req, res) =>{
    res.send("Acesso a rota usuarios");
});

app.get('/erro', (req, res)=>{
    res.status(404).json({mensagem: "Recurso não encontrado."});
});

app.get('/html', (req, res) =>{
    res.type('text/html');
    res.send('<h1>Rota HTML </h1>');
});

app.get('/resposta', (req, res) =>{
    const dados = { 
        mensagem : "Texto de mensagem"
    };
    res.status(200).type('application/json').json(dados);
});

app.get('/produtos', (req, res)=>{
    const categoria = req.query.categoria;
    res.status(200).json({
        categoriaRecebida: categoria
    });
});

app.get('/produtos/:id', (req, res) =>{
    const id = req.params.id;
    res.status(200).json({
        idRecebido: id
    });
});

app.post('/usuarios', (req, res)=>{
    const dados = req.body;

    res.status(200).json(
        {
            mensagem: "Usuário recebido com sucesso",
            dados: dados
        }
    );
});

app.listen(3000, () => {
    console.log("Servidor express executando na porta 3000\n http://localhost:3000");
});