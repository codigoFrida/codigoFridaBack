import { Router } from 'express'
import Modulos_Controller from './Modulos_Controller'

const router = Router();

const controller = new Modulos_Controller();

router.get('/', controller.getPaged)
router.get('/:id', controller.getById)
router.post('/:idModulo/contenido/:idContenido/ejercicio', controller.uploadEjercicio)


export default router;