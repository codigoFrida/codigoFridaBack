import HttpResponse from '../../system/HttpResponse'
import Modulos_Model from './Modulos_Model'

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
}

export default Modulos_Controller