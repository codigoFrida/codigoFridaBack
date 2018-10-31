import HttpResponse from '../../system/HttpResponse'
import Usuarios_Model from './Usuarios_Model'

class Usuarios_Controller {
    constructor() {}

    getPaged(req, res) {
        const Response = new HttpResponse(res);
        const Usuarios = new Usuarios_Model();

        Usuarios.getPaged(0, 0).then(modulos => {
            Response.ok(modulos);
        }).catch(err => {
            Response.badRequest(err);
        })
    }

    getById(req, res) {
        const Response = new HttpResponse(res);
        const Usuarios = new Usuarios_Model();
        const idUsuario = req.params.id

        Usuarios.getById(idUsuario).then(modulo => {
            Response.ok(modulo);
        }).catch(err => {
            Response.notFound(err);
        })
    }
}

export default Usuarios_Controller