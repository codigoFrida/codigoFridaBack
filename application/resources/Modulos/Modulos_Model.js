import pool from '../../system/MysqlPool';
import { reject } from 'bluebird';

class Modulos_Model {
    constructor() {}

    getPaged(page, perPage) {
        return new Promise((resolve, reject) => {
            const queryString = `SELECT id, numero, nombre as nombreModulo, fechaLimite, descripcion, cast((coalesce(progreso.subidos / progreso.todos, 0) * 100) as SIGNED) as progreso FROM modulos LEFT JOIN (
                SELECT idModulo, count(*) as todos, count(archivoSubido) as subidos from modulos inner join modulo_contenidos mc on modulos.id = mc.idModulo left join ejercicios e on mc.id = e.idContenidoModulo group by idModulo
              ) AS progreso on progreso.idModulo = id`;

            pool.query(queryString).then(rows => {
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
        
            const queryString = `SELECT id, numero,  nombre as nombreModulo, fechaLimite, descripcion, cast((coalesce(progreso.subidos / progreso.todos, 0) * 100) as SIGNED) as progreso FROM modulos LEFT JOIN (
                SELECT idModulo, count(*) as todos, count(archivoSubido) as subidos from modulos inner join modulo_contenidos mc on modulos.id = mc.idModulo left join ejercicios e on mc.id = e.idContenidoModulo group by idModulo
              ) AS progreso on progreso.idModulo = id WHERE id = ?`;
            pool.query(queryString, [
                id
            ]).then(modulos => {
                console.log(modulos.length);
                // if (modulos.length == 0) { throw modulos; }
                g_modulo = modulos[0];
        
                // Contenidos
                if (g_modulo) {
                    const queryString = "SELECT mc.id, mc.descripcion FROM modulo_contenidos AS mc LEFT JOIN ejercicios e on mc.id = e.idContenidoModulo where mc.idModulo = ?";
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
                const queryStringEjercicio = "SELECT mc.ejercicio as descripcion, e.archivoSubido from modulo_contenidos as mc left join ejercicios e on mc.id = e.idContenidoModulo where mc.id = ?"
                const promesasEjercicio = [];
                
                g_contenidos.forEach(contenido => {
                    // Materiales
                    const promesaMateriales = pool.query(queryStringMateriales, [
                        contenido.id
                    ]);
                    promesasMateriales.push(promesaMateriales);
        
                    // Comentarios
                    const promesaComentarios = pool.query(queryStringComentarios, [
                        contenido.id
                    ])
                    promesasComentarios.push(promesaComentarios);
        
                    // Ejercicio
                    const promesaEjercicio = pool.query(queryStringEjercicio, [
                        contenido.id
                    ])
                    promesasEjercicio.push(promesaEjercicio);
                });
        
                return Promise.all([
                    Promise.all(promesasMateriales),
                    Promise.all(promesasComentarios),
                    Promise.all(promesasEjercicio)
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
        
                const Ejercicios = data[2];
                Ejercicios.forEach((ejercicio, index) => {
                    g_modulo.contenidos[index].ejercicio = ejercicio[0]
                })
        
                console.log(JSON.stringify(g_modulo));
                resolve(g_modulo);
            }).catch(err => {
                console.log(err);
                reject(err);
            })
        })
    }

    addEjercicio(ejercicio) {
        return new Promise((resolve, reject) => {
            const queryString = `insert into ejercicios (idEquipo, idContenidoModulo, idUsuario, nombreArchivo, archivoSubido) VALUES
                (?, ?, ?, ?, ?)`
            pool.query(queryString, [
                ejercicio.idEquipo, 
                ejercicio.idContenido,
                ejercicio.idUsuario, 
                ejercicio.nombreArchivo,
                ejercicio.archivoSubido
            ]).then(meta => {
                resolve(meta)
            }).catch(err => {
                reject(err)
            })
        })
    }
}

export default Modulos_Model;