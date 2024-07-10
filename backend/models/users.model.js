const mongoose= require('mongoose');

const UserSchema=new mongoose.Schema({
    'name':{
        type:String,
        default:'',
        required:true 
    },
    'phoneNumber':{
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
        select:false
    },
    'address':{
        type:String,
        required:true
    },
    'is_verified':{
        type:Boolean,
        default:false,
        required:false
    },
    'is_validated':{
        type:Boolean,
        default:false,
        required:false
    },
    'is_active':{
        type:Boolean,
        default:false,
        required:false
    },
    'aadharCardNumber':{
        type:Number,
        required:true
    },
    'otp':{
        type:Number,
        required:false,
        default:null,
        select:false
    }
})

const User = mongoose.model('User',UserSchema);

module.exports={
    User
}