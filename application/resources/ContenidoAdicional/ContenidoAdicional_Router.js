import { Router } from 'express'
import ContenidoAdicional_Controller from './ContenidoAdicional_Controller'

const router = Router();

const controller = new ContenidoAdicional_Controller();

router.get('/', controller.getPaged)
// router.get('/:id', controller.getById)

export default router;