import { Router } from 'express'
import Usuarios_Controller from './Usuarios_Controller'

const router = Router();

const controller = new Usuarios_Controller();

router.get('/', controller.getPaged)
router.get('/:id', controller.getById)

export default router;