/* const http = require('node:http');

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain; charset=utf-8');
  res.end('Servidor HTTP ativo na rota /');
});

server.listen(3000, () => {
  console.log('Servidor executando em http://localhost:3000');
});
 */
const http = require('node:http');

const callback = (req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain; charset=utf-8');
  res.end('Resposta enviada pela função callback');
};

const server = http.createServer(callback);

server.listen(3000, () => {
  console.log('Servidor executando em http://localhost:3000');
});