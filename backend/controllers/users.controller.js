const { User } =require("../models/users.model");
const zod = require("zod");

const emailSchema=zod.string().email();
const passwordSchema = zod.string().min(6);
const phoneSchema=zod.number().min(10).max(10);
const nameSchema=zod.string();


const getUser= async(req,res)=>{
  const id=req.params.id;
  try{
      const user=await User.findOne({'_id':id});
      if(user){
          res.json({'success':true,'user':user}).status(200);
      }else{
        res.json({'success':false}).status(400);
      }
  }catch(error){
    res.json({'success':false,'message':error.message}).status(400);
  }
}

const createUser=async(req,res)=>{

}

const updateUser=async(req,res)=>{

}

const registerUser=async(req,res)=>{

}

const verifyUser=async(req,res)=>{

}

module.exports={
    getUser,createUser,updateUser,registerUser,verifyUser
}