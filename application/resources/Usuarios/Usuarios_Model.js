import pool from '../../system/MysqlPool';

class Usuarios_Model {
    constructor() {}

    getPaged(page, perPage) {
        return new Promise((resolve, reject) => {
            const limit = perPage;
            const offset = (page - 1) * perPage;
            const queryString = "SELECT * FROM usuarios LIMIT ? OFFSET ?";

            pool.query(queryString, [
                limit,
                offset
            ]).then(rows => {
                resolve(rows);
            }).catch(err => {
                reject(err);
            });
        })
    }

    getById(id) {
        return new Promise((resolve, reject) => {
            const queryString = "SELECT * FROM usuarios WHERE id = ?";

            pool.query(queryString, [
                id
            ]).then(rows => {
                resolve(rows[0]);
            }).catch(err => {
                reject(err);
            });
        })
    }

    getSinEquipoByRol(rolId) {
        return new Promise((resolve, reject) => {
            const queryString = "SELECT u.* FROM usuarios as u LEFT JOIN usuarios_equipos ue on u.id = ue.idUsuario WHERE ue.idEquipo IS NULL AND u.rolId = ?"

            pool.query(queryString, [
                rolId
            ]).then(rows => {
                resolve(rows);
            }).catch(err => {
                reject(err);
            });
        })
    }

    getMiPerfilById(id) {
        return new Promise((resolve, reject) => {
            const queryString = "SELECT id, nombre, apPaterno, apMaterno, fechaNacimiento, telefono, correo FROM usuarios WHERE id = ?";
    
            pool.query(queryString, [
                id
            ]).then(rows => {
                resolve(rows);
            }).catch(err => {
                reject(err);
            });

        })
    }
}

export default Usuarios_Model;