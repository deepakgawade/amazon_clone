const express = require("express");
const adminRouter = express.Router();
const admin = require("../middlewares/admin");
const Product = require("../models/product_model");

adminRouter.post("/admin/add-product", admin, async (req, res) => {
  try {
    const { name, description, price, quantity, category, images } = req.body;

    let product = new Product({
      name,
      description,
      price,
      quantity,
      category,
      images,
    });

    product = await product.save();
    return res.json(product);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

module.exports = adminRouter;
