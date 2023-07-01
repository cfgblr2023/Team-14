const { Schema, model } = require("mongoose");

// Defining Data Types
let ObjectId = Schema.Types.ObjectId;

// Creating a Schema
const userSchema = new Schema({
  // First Name of the User
  name: {
    type: String,
    required: true,
  },
  // Email of the User
  email: {
    type: String,
    required: true,
  },
  // Password
  password: {
    type: String,
    required: true,
  }
});

// Creating Data Model
const User = model("user", userSchema);

module.exports = user;