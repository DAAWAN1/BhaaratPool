const express = require('express');
const app= express();

const dotenv=require('dotenv').config();

const UserRouter = require('./routes/users.routes')

const port=process.env.PORT||8080;

app.use(express.json());
app.use('/users',UserRouter);
app.listen(port,()=>{
    console.log(`server listening on port : ${port}`);
})