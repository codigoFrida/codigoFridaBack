import HttpResponse from '../../system/HttpResponse'
import Sesiones_Model from './Sesiones_Model'

class Sesiones_Controller {
    constructor() {}

    logIn(req, res) {
        const response = new HttpResponse(res);
        const Sesiones = new Sesiones_Model();
        Sesiones.logIn(req.body.correo, req.body.contrasena).then(sesion => {
            response.created(sesion)
        }).catch(err => {
            response.unauthorized(err)
        })
    }
}

export default Sesiones_Controller