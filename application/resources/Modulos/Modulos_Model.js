import pool from '../../system/MysqlPool';
import { reject } from 'bluebird';

class Modulos_Model {
    constructor() {}

    getPaged(page, perPage) {
        return new Promise((resolve, reject) => {
            const limit = perPage;
            const offset = (page - 1) * perPage;
            const queryString = "SELECT id, numero, nombre, fechaLimite, descripcion FROM modulos LIMIT ? OFFSET ? ";

            pool.query(queryString, [
                limit,
                offset
            ]).then(rows => {
                resolve(rows);
            }).catch(err => {
                reject(err);
            })
        })
    }

    getById(id) {
        return new Promise((resolve, reject) => {

            var g_modulo;
            var g_contenidos;
        
            const queryString = "SELECT id, nombre as nombreModulo, fechaLimite, descripcion FROM modulos where id = ?";
            pool.query(queryString, [
                id
            ]).then(modulos => {
                console.log(modulos.length);
                // if (modulos.length == 0) { throw modulos; }
                g_modulo = modulos[0];
        
                // Contenidos
                if (g_modulo) {
                    const queryString = "SELECT mc.id, mc.descripcion, e.archivoSubido FROM modulo_contenidos AS mc LEFT JOIN ejercicios e on mc.id = e.idContenidoModulo where mc.idModulo = ?";
                    console.log(queryString);
                    return pool.query(queryString, [
                        g_modulo.id
                    ])
                }
                return [];
            }).then(contenidos => {
                g_contenidos = contenidos;
        
                if (g_contenidos.length > 0) {
                    g_modulo.contenidos = contenidos;
                }
        
                // Llenamos los materiales y comentarios del contenido a partir de aquí
                const queryStringMateriales = "SELECT id, nombre as urlDescarga, nombre as nombreArchivo FROM materiales WHERE idContenido = ?"
                const promesasMateriales = [];
                const queryStringComentarios = "SELECT cc.idUsuario, u.nombre AS nombreAutor, cc.createdAt as fecha, cc.comentario FROM contenido_comentarios AS cc INNER JOIN usuarios AS u on cc.idUsuario = u.id where cc.idContenido = ?"
                const promesasComentarios = [];
        
                g_contenidos.forEach(contenido => {
                    // Materiales
                    const promesaMateriales = pool.query(queryStringMateriales, [
                        contenido.idModulo
                    ]);
                    promesasMateriales.push(promesaMateriales);
        
                    // Comentarios
                    const promesaComentarios = pool.query(queryStringComentarios, [
                        contenido.id
                    ])
                    promesasComentarios.push(promesaComentarios);
                });
        
                return Promise.all([
                    Promise.all(promesasMateriales),
                    Promise.all(promesasComentarios)
                ]);
            }).then(data => {
                // Ponemos Materiales en su lugar
                const Materiales = data[0];
                Materiales.forEach((material, index) => {
                    g_modulo.contenidos[index].material = material
                });
        
                const Comentarios = data[1];
                Comentarios.forEach((comentario, index) => {
                    g_modulo.contenidos[index].comentarios = comentario
                })
        
                console.log(JSON.stringify(g_modulo));
                resolve(g_modulo);
            }).catch(err => {
                console.log(err);
                reject(err);
            })
        })
    }
}

export default Modulos_Model;