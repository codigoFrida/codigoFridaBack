import HttpResponse from '../../system/HttpResponse'
import Usuarios_Model from './Usuarios_Model'

class Usuarios_Controller {
    constructor() {}

    getPaged(req, res) {
        console.log(req);
        const Response = new HttpResponse(res);
        const Usuarios = new Usuarios_Model();
        const {rol, equipo} = req.query;
        const page = req.query.page || 1;
        const perPage = req.query.perPage || 10;

        if (rol != undefined && equipo != undefined && equipo == 0) {
            Usuarios.getSinEquipoByRol(rol).then(usuarios => {
                Response.ok(usuarios);
            }).catch(err => {
                Response.badRequest(err);
            })
        } else if (req.query.miPerfil) {
            Usuarios.getMiPerfilById(req.idUsuario).then(usuario => {
                Response.ok(usuario[0]);
            }).catch(err => {
                Response.notFound(err);
            })
        } else {
            Usuarios.getPaged(page,perPage).then(usuarios => {
                Response.ok(usuarios);
            }).catch(err => {
                Response.badRequest(err);
            })
        }

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