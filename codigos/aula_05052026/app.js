const http = require('node:http');

const callback = (req, res) => {
  const url = new URL(`http://localhost:3000${req.url}`);
  const rota = url.pathname;

  res.setHeader('Content-Type', 'application/json; charset=utf-8');

  try {
    if (rota === '/carros') {
        res.statusCode = 200;
        const resposta = {
            mensagem:"Acessou a rota carros"
        }
        res.end(JSON.stringify(resposta));
    }else if(rota === '/textoJs'){
        res.statusCode = 200;
        const textoJson = '{"nome":"Maria", "sobrenome":"Silva"}';
        const t = JSON.parse(textoJson);
        console.log(t.nome); // Teste o obj
        res.end(JSON.stringify(t)); // exibir no navgeador
    }
  }catch (erro) {
    res.statusCode = 500;
    res.end(JSON.stringify({ erro: 'TEste - Erro ao acessar o servidor' }));
  }
};

const server = http.createServer(callback);

server.listen(3000, () => {
  console.log('Servidor executando em http://localhost:3000');
});