const app = require('./app');
const { connect } = require('./database');

async function main(){
    //conexion base de datos
    await connect();
    //express application
    await app.listen(4000);
    console.log('Servidor en el puerto 4000: Conectado');
}

main();
