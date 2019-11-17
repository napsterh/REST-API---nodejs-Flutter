const mongoose = require('mongoose');

async function connect(){
    await mongoose.connect('mongodb://localhost/node-flutter-tutorial', {
        useNewUrlParser: true
    });
    console.log('base de datos conectado');
};

module.exports = { connect };