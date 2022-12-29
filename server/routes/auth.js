const express = require("express");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");

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

    const hasPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      fullName,
      email,
      password: hasPassword,
    });
    try {
      user = await user.save();
      return res.json(user);
    } catch (e) {
      return res.status(500).json({ error: e.message });
    }
  } catch (e) {
    return res.status(500).status({ msg: "Request failed" });
  }
});

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User  with this email does not exist" });
    }

    const isMatch = await bcryptjs.compare(password, user.password);

    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect password" });
    }

    const token=jwt.sign({ id: user._id }, "passwordKey2");
    console.log(user._doc);
   return res.status(200).json({token, ...user._doc});

  } catch (e) {
   return res.status(500).json({ error: e.message });
  }
});

authRouter.get("/hello-world", (req, res) => {
  res.json({ hello: "hello" });
});

authRouter.get("/", (req, res) => {
  res.json({ name: "deepak" });
});

module.exports = authRouter;
