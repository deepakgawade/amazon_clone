const express = require("express");
const userRouter = express.Router();
const auth = require("../middlewares/auth");
const { Product } = require("../models/product_model");
const User = require("../models/user_model");

userRouter.post("/api/add-to-cart", auth, async (req, res) => {
  console.log(req.body);
  try {
    const { id } = req.body;
    const product = await Product.findById(id);
    let user = await User.findById(req.user);
    if (user.cart.length == 0) {
      user.cart.push({ product, quantity: 1 });
    } else {
      let isProductFound = false;
      for (let i = 0; i < user.cart.length; i++) {
        if (user.cart[i].product._id.equals(product._id)) {
          isProductFound = true;
        }
      }

      if (isProductFound) {
        let producttt = user.cart.find((productt) =>
          productt.product._id.equals(product._id)
        );
        producttt.quantity += 1;
      } else {
        user.cart.push({ product, quantity: 1 });
      }
    }
    user = await user.save();
    return res.json({ ...user._doc, token: req.token });
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

userRouter.delete("/api/remove-from-cart/:id", auth, async (req, res) => {
  try {
    const id = req.params.id;
    const product = await Product.findById(id);
    let user = await User.findById(req.user);
    for (let i = 0; i < user.cart.length; i++) {
      if (user.cart[i].product._id.equals(product._id)) {
        if (user.cart[i].quantity == 1) {
          user.cart.splice(i, 1);
        } else {
          user.cart[i].quantity--;
        }
      }
    }

    await user.save();
    res.json({ ...user._doc, token: req.token });
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

//save address
userRouter.post("/api/address", auth, async (req, res) => {
  try {
    const { address } = req.body;
    let user = await User.findById(req.user);

    user.address = address;
    user = await user.save();
    res.json({ ...user._doc, token: req.token });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//save order once paymnet has been made

userRouter.post("/api/orders", auth, async (req, res) => {
  try {
    const { cart, address, totalPrice } = req.body;
    let products = [];
    for (let i = 0; i < cart.length; i++) {
      let product = await Product.findById(cart[i].product._id);
      if (product.quantity >= cart[i].quantity) {
        products.quantity -= cart[i].quantity;
        product.push({ product, quantity: cart[i].quantity });
        await product.save();
      } else {
        request.json({ msg: `${product.name} is out of stock!` });
      }
    }
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = userRouter;
