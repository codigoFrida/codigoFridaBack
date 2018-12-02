import pool from '../../system/MysqlPool';
import randomStringGenerator from 'randomstring';

class Equipos_Model {
  constructor() {}

  getPaged(page, perPage) {
    return new Promise((resolve, reject) => {
      const queryString = `SELECT id, nombre, codigo codigo FROM equipos`;

      var equipos;
      
      pool.query(queryString).then(rows => {
          equipos = rows;
        const promesas = [];
        const promesas2 = [];
      
        rows.forEach(row => {
          //Promesa Query para Obtener Fridas
          var queryString = "SELECT ue.id, ue.rolId, ue.nombre, ue2.idEquipo FROM usuarios as ue INNER JOIN usuarios_equipos as ue2 on ue.id = ue2.idUsuario WHERE ue.rolId=1 && ue2.idEquipo=?";
          const promesa1 = pool.query(queryString, [
              row.id
          ]);
          promesas.push(promesa1);
          
          //Promesa Query para Obtener Mentores
          queryString = "SELECT ue.id, ue.rolId, ue.nombre, ue2.idEquipo FROM usuarios as ue INNER JOIN usuarios_equipos as ue2 on ue.id = ue2.idUsuario WHERE ue.rolId=2 && ue2.idEquipo=?";
          const promesa2 = pool.query(queryString, [
                row.id
            ]);
          promesas2.push(promesa2);
        });
      
          var res = Promise.all(promesas);
          var res2 = Promise.all(promesas2);
          return Promise.all([res, res2]);
      
      }).then(resultados => {
        resultados[0].forEach((resultado, index) => {
          equipos[index].integrantes = resultado
        })
        resultados[1].forEach((resultado, index) => {
          equipos[index].mentores = resultado
        })
      
        console.log(JSON.stringify(equipos));
        resolve(equipos);
      }).catch(err => {
          reject(err);
      });
    })
  }

  getById(idEquipo) {
    return new Promise((resolve, reject) => {
      const queryString = "SELECT id, nombre, codigo FROM equipos WHERE id = ?";
      var equipos;

      pool.query(queryString, [idEquipo]).then(rows => {
          equipos = rows;
        const promesas = [];
        const promesas2 = [];
        const promesas3 = [];

        rows.forEach(row => {
          //Promesa Query para Obtener Fridas
          var queryString = "SELECT u.id, u.nombre, u.apPaterno, u.apMaterno, u.apPaterno, u.fotografia, u.correo, u.fechaNacimiento, u.fotografia FROM usuarios AS u INNER JOIN usuarios_equipos ue on u.id = ue.idUsuario WHERE u.rolId = 1 && ue.idEquipo = ?";
          const promesa1 = pool.query(queryString, [
            row.id
          ]);
          promesas.push(promesa1);
          
          //Promesa Query para Obtener Mentores
          queryString = "SELECT u.id, u.nombre, u.apPaterno, u.apMaterno, u.apPaterno, u.fotografia, u.correo FROM usuarios AS u INNER JOIN usuarios_equipos ue on u.id = ue.idUsuario WHERE u.rolId = 2 && ue.idEquipo = ?";
          const promesa2 = pool.query(queryString, [
              row.id
            ]);
          promesas2.push(promesa2);

          //Promesa Query para Obtener Insignias
          queryString = "SELECT insignia2.id, insignia.id AS idInsignia, insignia.nombre, insignia.descripcion FROM insignia INNER JOIN equipos_insignia insignia2 on insignia.id = insignia2.idInsignia WHERE insignia2.idEquipo = 1";
          const promesa3 = pool.query(queryString, [
              row.id
            ]);
          promesas3.push(promesa3);
        });

          var res = Promise.all(promesas);
          var res2 = Promise.all(promesas2);
          var res3 = Promise.all(promesas3);
          return Promise.all([res, res2, res3]);

      }).then(resultados => {
          equipos[0].integrantes = resultados[0];
          equipos[0].mentores = resultados[1];
          equipos[0].insignias = resultados[2];

        console.log(JSON.stringify(equipos[0]));
        resolve(equipos[0]);
      }).catch(err => {
          reject(err);
      });
    })
  }

  getEquipoByClave(codigo) {
    return new Promise((resolve, reject) => {
      pool.query('SELECT * FROM equipos WHERE codigo = ?', [
        codigo
      ]).then(result => {
        resolve(result[0])
      }).catch(err => {
        reject(err);
      })
    })
  }

  addEquipo(nombre) {
    const codigo = randomStringGenerator.generate(6);
    return new Promise((resolve, reject) => {
      pool.query('INSERT INTO equipos (nombre, codigo) VALUES (?, ?)', [
        nombre,
        codigo
      ]).then(result => {
        resolve(result)
      }).catch(err => {
        reject(err);
      })
    })
  }
  
  addUserToEquipo(idUsuario, idEquipo) {
    const queryString = 'INSERT INTO usuarios_equipos (idUsuario, idEquipo) VALUES (?, ?)';
    return new Promise((resolve, reject) => {
      pool.query(queryString, [
        idUsuario,
        idEquipo
      ]).then(meta => {
        resolve(meta);
      }).catch(err => reject(err))
    })
  }
}

export default Equipos_Model;