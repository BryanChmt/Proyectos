const mongoose = require('mongoose');//inicializar el mongoose

async function connect(){
    await mongoose.connect('mongodb://localhost/node-tutorial',{//llamado a una base de datos
        useNewUrlParser:true,//no mostrar menaje de error en cada pantalla
    });
    console.log('Database: Connected');

};

module.exports = {connect};//para poder llamarlo en otros archivos se exporta de esa forma

