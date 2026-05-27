const express = require('express');

const app = express();

const routerCarros = require('./routes/carros'); // novo

app.use(express.json());
app.use('/carros', routerCarros); // novo

app.listen(3000, () => {
    console.log("Servidor express executando na porta 3000\n http://localhost:3000");
});