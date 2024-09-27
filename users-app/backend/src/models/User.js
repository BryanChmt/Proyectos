const {Schema,model} = require('mongoose');//schema datos que voy a guardar


const userSchema = new Schema({
    firstName: String,
    lastName:String,
    avatar:String,
});

module.exports = model('User',userSchema);//modelo que sirve para poder editar datos