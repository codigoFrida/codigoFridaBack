import Mysql from 'promise-mysql';
import { reject } from 'bluebird';

class Modulos_Model {
    constructor() {}

    getPaged(page, perPage) {
        return new Promise((resolve, reject) => {
            resolve([
                {
                    id: 1,
                    numero: 1,
                    fechaLimite: '2018-12-31',
                    descripcion: 'En este módulo aprenderemos a encender la computadora alvvvv'
                },
                {
                    id: 2,
                    numero: 2,
                    fechaLimite: '2018-12-31',
                    descripcion: 'En este módulo, aprenderemos a usar el extintor por si queman la pc'
                }
            ])
        })
    }

    getById(id) {
        return new Promise((resolve, reject) => {
            console.log(id);
            switch(id) {
                case "1":
                    resolve({
                        id: 1,
                        numero: 1,
                        fechaLimite: '2018-12-31',
                        descripcion: 'En este módulo aprenderemos a encender la computadora alvvvv'
                    })
                    break
                case "2":
                    resolve({
                        id: 2,
                        numero: 2,
                        fechaLimite: '2018-12-31',
                        descripcion: 'En este módulo, aprenderemos a usar el extintor por si queman la pc'
                    })
                    break
                default:
                    reject({
                        message: 'El módulo no existe'
                    })
                    break
            }
        })
    }
}

export default Modulos_Model;