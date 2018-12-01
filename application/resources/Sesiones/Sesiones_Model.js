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

    getAuthData(correo) {
        const queryString = "SELECT id, contrasena, sal FROM usuarios WHERE correo = ?";
        return pool.query(queryString, [correo]);
    }

    checkSession(token) {
        const queryString = "SELECT u.*, ANY_VALUE(ue.idEquipo) AS equipo FROM sesiones AS s INNER JOIN usuarios AS u ON s.usuarioId = u.id LEFT JOIN usuarios_equipos ue on u.id = ue.idUsuario GROUP BY id";
        return pool.query(queryString, [token]);
    }
}

export default Sesiones_Model;