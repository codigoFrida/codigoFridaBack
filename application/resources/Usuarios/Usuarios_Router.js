import { Router } from 'express'
import Usuarios_Controller from './Usuarios_Controller'

const router = Router();

const controller = new Usuarios_Controller();

router.get('/', middlewareSesion, controller.getPaged)
router.get('/:id', middlewareSesion, controller.getById)
router.post('/', controller.addUser)

export default router;