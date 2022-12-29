//import from packages
const express=require('express');
const mongoose=require('mongoose');




//import from otherfiles
const authRouter=require('./routes/auth');



//init
const app=express();
const PORT=8080;

//middleware
app.use(express.json());
app.use(authRouter);

//connections
const DB="mongodb+srv://deepak:HdyrgAs_dgh@cluster0.pxfvxo3.mongodb.net/?retryWrites=true&w=majority";

mongoose.set('strictQuery', false);

mongoose.connect(DB).then(()=>{console.log("connection succcesfull")}).catch((e)=>{console.log(e)});

app.listen(PORT,"0.0.0.0",()=>{
    console.log(`onnetcted to port ${PORT} hello`);
});//localhost or else device port on internet you want to connect.



