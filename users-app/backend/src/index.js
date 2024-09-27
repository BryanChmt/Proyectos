const app = require('./app');//requiero el archivo ('./archivo')
const{connect} = require('./database');//primero requerir modulo que esta dentro de database y colocar la que requiero
async function main(){
   
   await connect();//database connection


   await app.listen(4000); //espera,ejecuta puerto numero(4000)
   console.log ('Server on port 4000: Connected'); //me devuelva lo del perto
}

main(); //llamado de funcion