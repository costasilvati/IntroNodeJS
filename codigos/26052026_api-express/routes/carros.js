const express = require('express');

const router = express.Router();

const connection = require('../database/connection');

router.get('/', (req, res)=>{
    const sql = 'SELECT * FROM carros';
    connection.query(sql,(erro, resultados) =>{
        if(erro){
            res.status(500).json(
                {erro: "Erros aos buscar carros"});
        }
        res.status(200).json(resultados);
    });
});

router.get('/:id', (req, res)=>{
    const id = req.params.id;
    const sql = 'SELECT * FROM carros WHERE id = ?';
    connection.query(sql,[id],(erro, resultados) =>{
        if(erro){
            res.status(500).json(
                {erro: "Erros aos buscar carros"});
        }
        if(resultados.length === 0){
            return res.status(404).json({erro: "Carro não encontrado"});
        }
        res.status(200).json(resultados[0]);
    });
});



router.get('/luxo', (req, res)=>{
    res.json({categoria: 'luxo'});
});


router.post('/', (req, res)=>{
    const {nome, marca, ano, preco, placa} = req.body;
    const sql = `INSERT INTO carros (nome, marca, ano, preco, placa) VALUES (?,?,?,?,?)`;

    connection.query(sql, [nome, marca, ano, preco, placa], (erro, resultados) =>{
        if(erro){
            return res.status(500).json(
                {erro: "Erro ao insrir carro"}
            )
        }
        res.status(201).json({
            mensagem: "Inserido com sucesso",
            idInserido: resultados.insertId
        });
    })
});

router.put('/:id', (req, res)=>{
    const id = req.params.id;
    const {nome, marca, ano, preco, placa} = req.body;
    const sql = `UPDATE carros SET nome = ?, marca = ?, ano = ?, preco = ?, placa = ? WHERE id = ?`;

    connection.query(sql, [nome, marca, ano, preco, placa, id], (erro, resultados) =>{
        if(erro){
            return res.status(500).json(
                {erro: "Erro ao insrir carro"}
            )
        }
        res.status(201).json({
            mensagem: "Atualizado com sucesso"
        });
    })
});


router.delete('/:id', (req, res) => {
  const id = req.params.id;
  const sql = 'DELETE FROM carros WHERE id = ?';
  connection.query(sql, [id], (erro, resultado) => {
    if (erro) {
      return res.status(500).json({
        erro: 'Erro ao remover carro'
      });
    }
    res.json({
      mensagem: 'Carro removido com sucesso'
    });
  });
});

module.exports = router;