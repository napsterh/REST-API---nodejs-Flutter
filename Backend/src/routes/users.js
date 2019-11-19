const { Router } = require('express');
const router = Router();

const User = require('../models/User');

const faker = require('faker');

router.get('/api/users', async (req, res) => {
    const users = await User.find();
    res.json({users});
});

router.get('/api/users/create', async (req, res) => {
    for(let i=0; i<10; i++){
        await User.create({
            nombre: faker.name.firstName(),
            apellido: faker.name.lastName(),
            avatar: faker.image.avatar()
        });
    }
    res.json({message: '10 usuarios creados'});
})

module.exports = router;