const express = require('express');
const router=express.Router();

const { getUser, createUser, updateUser, registerUser, verifyUser } = require('../controllers/users.controller');
const { notFound }=require('../utility/utility')

router.get('/:id',getUser);

router.post('/',createUser);

router.put('/:id',updateUser);

router.post('/register',registerUser);

router.post('/verify',verifyUser);

router.all('/*',notFound)

module.exports.router=router;
