const Mysql = require('promise-mysql');

getById = function(id) {
    const pool = new Mysql.createPool({
        host: "localhost",
        user: "root",
        password: "123456",
        database: "codigoFrida"
    });

    var g_modulo;
    var g_contenidos;

    const queryString = "SELECT id, nombre as nombreModulo, fechaLimite, descripcion FROM modulos where id = ?";
    console.log(queryString);
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
        const queryStringMateriales = "SELECT id, nombre as urlDescarga, nombre as nombreArchivo FROM materiales WHERE idModulo = ?"
        const promesasMateriales = [];
        const queryStringComentarios = "SELECT cc.idUsuario, u.nombre AS nombreAutor, cc.createdBy as fecha, cc.comentario FROM contenido_comentarios AS cc INNER JOIN usuarios AS u on cc.idUsuario = u.id where cc.idContenido = ?"
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
        pool.end();
    }).catch(modulos => {
        console.log(modulos)
    })
}

getById(1)