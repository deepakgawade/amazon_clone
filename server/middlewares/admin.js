const jwt = require("jsonwebtoken");

const User = require("../models/user_model");

const admin = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token)
      return res.json(401).json({ msg: "No token found,access denied" });
    const verified = jwt.verify(token, "passwordKey2");
    if (!verified)
      return res
        .status(401)
        .json({ msg: "token verification failed, authtorization denied" });
    const user = await User.findById(verified.id);
    if (user.type == "user" || user.type == "seller")
      return res.status(401).json({ msg: "Not a admin, access denied" });
    req.token = token;
    req.user = verified.id;

    next();
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
};

module.exports = admin;
