const { Router } = require('express');//router = a una parte del modulo express
const router = Router();//devuelve un objeto 

const User = require('../models/User');

const faker = require('faker');//enviar datos de prueba

router.get('/api/Users', async (req, res) => {
    const users = await User.find();
        res.json({users});//mostrar datos
});

router.get('/api/Users/create', async (req, res) => {
    for (let i = 0; i < 5; i++) {//ciclo que genera datos de prueba
        await User.create({
            firstName: faker.name.firstName(),
            lastName: faker.name.lastName(),
            avatar: faker.image.avatar(),
        });
    }
    res.json({ message: '5 Users created' });
});


module.exports = router;