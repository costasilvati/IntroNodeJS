const { expressjwt } = require('express-jwt');

const segredo = 'chave_secreta_da_api';

const protegerRota = expressjwt({
  secret: segredo,
  algorithms: ['HS256']
});

module.exports = {
  segredo,
  protegerRota
};