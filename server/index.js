//import from packages
const express=require('express');


//import from otherfiles
const authRouter=require('./routes/auth')


//init
const app=express();
const PORT=3000;

//middleware
app.use(authRouter);



app.listen(PORT,()=>{
    console.log(`onnetcted to port ${PORT} hello`);
});//localhost or else device port on internet you want to connect.

app.get('/hello-world',(req,res)=>{
    res.json({"hello":"hello"})
    
});

app.get('/',(req,res)=>{
    res.json({"name":"deepak"});
});


