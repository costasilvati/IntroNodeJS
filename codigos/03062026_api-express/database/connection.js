const mysql = require('mysql2');

const connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database : 'api_carros'
    });

connection.connect((error) =>{
    if(error){
        console.log("Erro ao conectar no banco de dados");
        return;
    }
    console.log("Conectado ao MySQL");
});
module.exports = connection;