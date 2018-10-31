import { Router } from 'express'
import Usuarios_Router from './Usuarios/Usuarios_Router'
import Sesiones_Router from './Sesiones/Sesiones_Router'
import Modulos_Router from './Modulos/Modulos_Router'

const router = Router();

router.use('/usuarios', Usuarios_Router)
router.use('/sesiones', Sesiones_Router)
router.use('/modulos', Modulos_Router)

export default router
