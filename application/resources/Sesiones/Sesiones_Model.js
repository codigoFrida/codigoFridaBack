import Mysql from 'promise-mysql';
import UUID from 'uuid/v4';
import { reject } from 'bluebird';

class Sesiones_Model {
    constructor() {}

    logIn(correo, contrasena) {
        return new Promise((resolve, reject) => {
            if (correo != "fbatista.fxbi@gmail.com" || contrasena != "123456")
                reject({
                    message: "Credenciales no válidas"
                });
            else resolve({
                nombre: 'Paco el chido',
                apPaterno: 'Batista',
                apMaterno: 'Ibarra',
                fechaNacimiento: '01-01-1998',
                telefono: '3121196780',
                correo: 'fbatista.fxbi@gmail.com',
                fotografia: '68162381-6ee2-4825-b202-92ca93d9e99b',
                idRol: '1',
                token: UUID()
            })
        })
    }
}

export default Sesiones_Model;