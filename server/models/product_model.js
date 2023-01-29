const mongoose = require("mongoose");
//    required String name,
// required String description,
// required double price,
// required double quantity,
// required String category,
// required List<String> images,
// String? id,

const productSchema = mongoose.Schema({
  name: {
    require: true,
    type: String,
    trim: true,
  },
  description: {
    require: true,
    type: String,
    trim: true,
  },
  price: {
    require: true,
    type: Number,
    trim: true,
  },
  quantity: {
    require: true,
    type: Number,
    trim: true,
  },
  category: {
    require: true,
    type: String,
    trim: true,
  },
  images: [
    {
      require: true,
      type: String,
    },
  ],
  //ratings
});

const Product = mongoose.model("Product", productSchema);

module.exports = Product;
