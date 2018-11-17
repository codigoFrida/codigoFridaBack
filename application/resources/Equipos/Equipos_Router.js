import { Router } from 'express'
import Equipos_Controller from './Equipos_Controller'

const router = Router();

const controller = new Equipos_Controller();

router.get('/', controller.getPaged)
router.get('/:id', controller.getById)

export default router;