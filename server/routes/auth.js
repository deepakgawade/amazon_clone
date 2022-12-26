const { json } = require("express");
const express = require("express");
const User = require("../models/user_model");

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {

  try {
    const { fullName, email, password } = req.body;

    const existingUser = await User.findOne({ email });

    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User already exist with same email" });
    }

    let user = new User({
      fullName,
      email,
      password,
    });
    try {
      user = await user.save();
      return res.json(user);

      
    } catch (e) {

      return res.status(500).json({error:e.message});

    }
 
  
    
  } catch (e) {

    return res.status(500).status({msg:"Request failed"});
    
  }

  //encrypt password,
  //save in db,
  //return data to user.
});

authRouter.get("/hello-world", (req, res) => {
  res.json({ hello: "hello" });
});

authRouter.get("/", (req, res) => {
  res.json({ name: "deepak" });
});

module.exports = authRouter;
