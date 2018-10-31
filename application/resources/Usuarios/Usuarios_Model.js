import Mysql from 'promise-mysql'

class Usuarios_Model {
    constructor() {}

    getPaged(page, perPage) {
        return new Promise((resolve, reject) => {
            resolve([
                {
                    id: 1,
                    nombre: 'Paco el chido',
                    apPaterno: 'Batista',
                    apMaterno: 'Ibarra',
                    fechaNacimiento: '01-01-1998',
                    telefono: '3121196780',
                    correo: 'fbatista.fxbi@gmail.com',
                    fotografia: '68162381-6ee2-4825-b202-92ca93d9e99b',
                    idRol: '1'
                }
            ]);
        })
    }

    getById(id) {
        return new Promise((resolve, reject) => {
            if (id == 1)
                resolve({
                        id: 1,
                        nombre: 'Paco el chido',
                        apPaterno: 'Batista',
                        apMaterno: 'Ibarra',
                        fechaNacimiento: '01-01-1998',
                        telefono: '3121196780',
                        correo: 'fbatista.fxbi@gmail.com',
                        fotografia: '68162381-6ee2-4825-b202-92ca93d9e99b',
                        idRol: '1'
                });
            else reject({
                message: "No se encuentra el usuario"
            })
        })
    }
}

export default Usuarios_Model;