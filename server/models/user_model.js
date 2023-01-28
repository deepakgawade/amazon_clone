const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  fullName: {
    required: true,
    type: String,
    trim: true,
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const regex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
        // const regex =   /^[a-zA-Z0-9.! #$%&'*+/=? ^_`{|}~-]+@[a-zA-Z0-9-]+(?:\. [a-zA-Z0-9-]+)*$/;
        return value.match();
      },
      message: "Please enter valid email address",
    },
  },
  password: {
    required: true,
    type: String,
    validate: {
      validator: (value) => {
        return value.length > 6;
      },
      message: "Please provide strong password",
    },
  },
  address: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    default: "user",
  },
  //cart
});

const User = mongoose.model("User", userSchema);

module.exports = User;
