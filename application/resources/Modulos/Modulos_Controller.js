import HttpResponse from '../../system/HttpResponse'
import Modulos_Model from './Modulos_Model'
import UUID from 'uuid/v4'
import fs from 'fs'

class Modulos_Controller {
    constructor() {}

    getPaged(req, res) {
        const Response = new HttpResponse(res);
        const Modulos = new Modulos_Model();

        Modulos.getPaged(0, 0).then(modulos => {
            Response.ok(modulos);
        }).catch(err => {
            Response.internalServerError(err);
        })
    }

    getById(req, res) {
        const Response = new HttpResponse(res);
        const Modulos = new Modulos_Model();
        const idModulo = req.params.id

        Modulos.getById(idModulo).then(modulo => {
            Response.ok(modulo);
        }).catch(err => {
            Response.notFound(err);
        })
    }

    uploadEjercicio(req, res) {
        const Response = new HttpResponse(res);
        const Modulos = new Modulos_Model();

        const nombreArchivo = UUID();
        fs.writeFile(`application/public/ejercicios/${nombreArchivo}`, req.body.archivo, 'base64', (err) => {if (err) {console.error(err); throw err}});

        delete req.body.archivo;
        const ejercicio = req.body;
        ejercicio.archivoSubido = nombreArchivo;
        ejercicio.idContenido = req.params.idContenido

        Modulos.addEjercicio(ejercicio).then(meta => {
            Response.ok(meta);
        }).catch(err => {
            console.error(err);
            Response.ErrorGenerico();
        })
    }
}

export default Modulos_Controller