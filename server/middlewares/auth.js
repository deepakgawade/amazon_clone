const jwt=require('jsonwebtoken');
const User = require('../models/user_model');

const auth=async(req,res,next)=>{

    try{
        const token=req.header("x-auth-token");
        if(!token)return res.status(401).json({msg:"No token found, access denied"});
    const verified= jwt.verify(token,"passwordKey2");
        if(!verified)return res.status(401).json({msg:"token verification failed, authorization denied."});
        req.user=verified.indexOf;
        req.token=token;
        next();

    }catch (err){
        return res.status(500).json({error:err.message})

    }
};

module.exports=auth;