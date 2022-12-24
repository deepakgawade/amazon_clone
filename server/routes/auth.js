const express =require('express');

const authRouter=express.Router();
authRouter.get('/myroute',(req,res)=>{
    res.json({myroute:"Panaji"});
});

authRouter.post('/api/signup',(req,res)=>{
    //get data from client
    //validate data,
    //encrypt password,
    //save in db, 
})

module.exports=authRouter;