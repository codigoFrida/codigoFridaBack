import HttpResponse from '../../system/HttpResponse'
import ContenidoAdicional_Model from './ContenidoAdicional_Model'

class ContenidoAdicional_Controller {
    constructor() {}

    getPaged(req, res) {
        const Response = new HttpResponse(res);
        const Modulos = new ContenidoAdicional_Model();
        const page = req.query.page || 1;
        const perPage = req.query.perPage || 10;

        Modulos.getPaged(page, perPage).then(modulos => {
            Response.ok(modulos);
        }).catch(err => {
            Response.internalServerError(err);
        })
    }

    // getById(req, res) {
    //     const Response = new HttpResponse(res);
    //     const Modulos = new Modulos_Model();
    //     const idModulo = req.params.id

    //     Modulos.getById(idModulo).then(modulo => {
    //         Response.ok(modulo);
    //     }).catch(err => {
    //         Response.notFound(err);
    //     })
    // }
}

export default ContenidoAdicional_Controller