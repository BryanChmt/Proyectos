const express = require('express'); //modulo
const app = express(); //inicializar
const morgan = require('morgan');//modulo
const cors = require('cors');//compartir con otros servidores



app.use(morgan('dev'));// configuracion del morgan ctrl+expacio y aparecen otras config
app.use(cors());
app.use(require('./routes/users'));//lugar de donde quiero que ejecute

module.exports = app;//exportar