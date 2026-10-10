const express = require('express');
const jwt = require('jsonwebtoken');

const router = express.Router();

const connection = require('../database/connection');
const {segredo} = require('../middleware/auth');

router.post('/login', (req, res) =>{
    const {email, senha} = req.body;

    const sql = "SELECT * FROM usuarios WHERE email = ? AND senha = ?";

    connection.query(sql, [email, senha], (erro, resultados) => {
        if(erro){
            return(res.status(500).json({mensagem: "Erro ao executar consulta"}));
        }
        if(resultados.length === 0){
            return(res.status(401).json({mensagem: "Usuário ou senha inválido."}));
        }
        const usuario = resultados[0];

        const token = jwt.sign({
            id: usuario.id,
            nome: usuario.nome,
            email: usuario.email
        },
        segredo,
        {expiresIn: '1h'}
    );
    res.json({
        mensagem: "Login realizado com sucesso",
        token: token
    });

    });
});

module.exports = router;