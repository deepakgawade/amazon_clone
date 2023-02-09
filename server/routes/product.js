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

//seaarch product products/search/:searchquery --params

productRouter.get("/api/products/search/:name", auth, async (req, res) => {
  try {
    const query = req.params.name;
    console.log(query);
    const products = await Product.find({
      name: { $regex: query, $options: "i" },
    });
    res.json({ products: products });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// route for rating

productRouter.post("/api/rate-product", auth, async (req, res) => {
  try {
    const { id, rating } = req.body;

    let product = await Product.findById(id);

    for (let i = 0; i < product.ratings.length; i++) {
      if (product.ratings[i].userId == req.userId) {
        product.ratings.splice(i, 1);
        break;
      }
    }
    const ratingSchema = { userId: req.user, rating };

    product.ratings.push(ratingSchema);
    product = await product.save();

    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = productRouter;
