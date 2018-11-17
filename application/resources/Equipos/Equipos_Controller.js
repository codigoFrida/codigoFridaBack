import HttpResponse from '../../system/HttpResponse'
import Equipos_Model from './Equipos_Model'

class Equipos_Controller {
    constructor() {}

    getPaged(req, res) {
        const Response = new HttpResponse(res);
        const Equipos = new Equipos_Model();
        const page = req.query.page || 1;
        const perPage = req.query.perPage || 10;

        Equipos.getPaged(page, perPage).then(modulos => {
            Response.ok(modulos);
        }).catch(err => {
            Response.internalServerError(err);
        })
    }

    getById(req, res) {
        const Response = new HttpResponse(res);
        const Equipos = new Equipos_Model();
        const idEquipo = req.params.id

        Equipos.getById(idEquipo).then(modulo => {
            Response.ok(modulo);
        }).catch(err => {
            Response.notFound(err);
        })
    }
}

export default Equipos_Controller