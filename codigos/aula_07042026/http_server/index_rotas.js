const http = require('node:http');

const callback = (req, res) => {
  const url = new URL(`http://localhost:3000${req.url}`);
  const rota = url.pathname;

  res.setHeader('Content-Type', 'text/plain; charset=utf-8');

  if (rota === '/') {
    res.statusCode = 200;
    res.end('Você acessou a rota /');
  } else if (rota === '/carros') {
    res.statusCode = 200;
    res.end('Você acessou a rota /carros');
  } else {
    res.statusCode = 404;
    res.end('Rota inválida');
  }
};

const server = http.createServer(callback);

server.listen(3000, () => {
  console.log('Servidor executando em http://localhost:3000');
});