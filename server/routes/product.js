const express = require("express");
const productRouter = express.Router();
const auth = require("../middlewares/auth");
const Product = require("../models/product_model");
//api/products?category=Essentials
productRouter.get("/api/products", auth, async (req, res) => {
  try {
    const category = req.query.category;
    console.log(category);
    const products = await Product.find({ category: category });
    console.log(products);
    return res.json({ products: products });
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

module.exports = productRouter;
