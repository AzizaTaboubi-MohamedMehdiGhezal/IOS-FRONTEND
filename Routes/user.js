import express from 'express'
const router = express.Router()


//import UserController from '../Controllers/usersController'

import * as UserController from '../Controllers/usersController.js'

router.get('/', UserController.index)
router.post('/login', UserController.login)
router.route("/register").post(UserController.register)
router.delete('/delete/{_id}', UserController.deletee)
router.post("/send-confirmation-email", UserController.sendConfirmationEmail)
router.get("/confirmation/:token", UserController.confirmation)
router.post('/forgotPassword',UserController.forgotPassword)
router.post("/confirmationOtp",UserController.confirmationOTP)


export default router
