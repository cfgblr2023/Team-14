const express = require("express");
//const role = require("../../config/role");

// Creating the Router
const router = express.Router();

// Importing the User Model
const User = require("../../models/user");

// Importing Middlewares
const authMiddleware = require("../../middlewares/auth");

/*
  @route  POST /api/add/user
  @desc   Adding a User
  @access { admin employee }
  @params { firstName lastName email regNo }
  @return { user messsage success }
*/

const client = new MongoClient(process.env.MONGO_URI);

router.post("/user", async (req, res) => {
  // Validating the Request Body
  const { errors, isValid } = userValidator(req.body);

  // Checking for Validation Errors
  if (!isValid) {
    return res.status(400).json(errors);
  }

  // Checking existing user
  try {
    // Finding a User
    const user = await User.findOne({
      regNo: req.body.regNo,
    });

    if (user) {
      // If exisiting user is found
      errors.regNo = "User already exists";
      return res.status(400).json(errors);
    }
  } catch (err) {
    console.log(err);
    return res.status(500).json({
      message: "Internal Server Error",
    });
  }

  // Creating a new user
  const newUser = new User({
    name: req.body.name.toLowerCase(),
    email: req.body.email.toLowerCase(),
    password: req.body.password  
  });

  try {
    // Saving the new user
    await newUser.save();
  } catch (err) {
    console.log(err);
    return res.status(500).json({
      message: "Internal Server Error",
    });
  }

  // Returning the new user
  return res.status(200).json({
    success: true,
    message: "Registered for Volunteering!",
    user: newUser,
  });
});

module.exports = router;