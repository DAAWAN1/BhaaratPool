const mongoose= require('mongoose');

const UserSchema=new mongoose.Schema({
    'name':{
        type:String,
        default:'',
        required:true 
    },
    'phone number':{
        type:Number,
        required:true,
        unique:true
    },
    'email':{
        type:String,
        required:true,
        trim:true,
        unique:true,
        lowercase:true,
    },
    'password':{
        type:String,
        required:true,
    },
    'address':{
        type:String,
        required:true,
    },
    'is_verified':{
        type:Boolean,
        default:false,
        required:false
    },
    'aadhar card number':{
        type:Number,
        required:true
    },
    'otp':{
        type:Number,
        required:false,
        default:null
    }
})

const User = mongoose.model('User',UserSchema);

module.exports={
    User
}