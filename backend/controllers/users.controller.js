const { User } =require("../models/users.model");
const zod = require("zod");
const randomstring = require('randomstring');

const emailSchema=zod.string().email();
const passwordSchema = zod.string().min(6);
const phoneSchema=zod.number().min(10).max(10);
const nameSchema=zod.string();
const addharSchema=zod.number().min(12).max(12);
const addressSchema=zod.string();

const validate=(email,password,phoneNumber,name,address,addharCardNumber)=>{
  if(emailSchema.parse(email)&&passwordSchema.parse(password)&&phoneSchema(phoneNumber)&&nameSchema(name)&&addressSchema.parse(address)&&addharSchema.parse(addharCardNumber)){
    return true;
  }else{
    return false;
  }
}

function generateOTP() {
  return randomstring.generate({
      length: 4,
      charset: 'numeric'
  });
}


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
  const {email,password,phoneNumber,name,address,addharCardNumber}=req.params.body;
  let validateUser=validate(email,password,phoneNumber,name,address,addharCardNumber);
  if(validateUser){
    let user=new User({email,password,phoneNumber,name,address,addharCardNumber});
    try{
      await user.save();
    }catch(error){
      res.json({'message':error.message,'success':false});
    }
    res.json({'message':'user created successfully','success':true})
  }else{
    res.json({'message':'Invalid details','success':false})
  }
}

const updateUser=async(req,res)=>{
  const {email,password,phoneNumber,name,address,addharCardNumber}=req.params.body;
  let validateUser=validate(email,password,phoneNumber,name,address,addharCardNumber);
  if(validateUser){
    let id=req.params.id;
    const user=await User.findOne({'_id':id});
    if(user){
      await User.updateOne({'_id':id},{email,password,phoneNumber,name,address,addharCardNumber});
      res.json({'message':'user updated successfully','success':true})
    }else{
      res.json({'message':'user does not exists','success':false});
    }
  }else{
    res.json({'message':'Invalid details','success':false})
  }
}

const registerUser=async(req,res)=>{
   const {phoneNumber}=req.body;
   const user=await User.findOne({phoneNumber});
   const otp=generateOTP();
   try{
    await User.updateOne({'_id':user_id},{otp})
   }catch(error){
    res.json({'message':error.message,'success':false});
   }
   res.json({'message':'otp created successfully','succes':true});
}

const verifyUser=async(req,res)=>{

}

module.exports={
    getUser,createUser,updateUser,registerUser,verifyUser
}