const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const { MongoClient } = require('mongodb');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Predefined login credentials
const credentials = {
  username: 'admin',
  password: 'password123'
};

const uri = "mongodb+srv://admin:admin@cluster0.t6rhgrq.mongodb.net/?retryWrites=true&w=majority"
const client = new MongoClient(uri);

app.post('/login', (req, res) => {
  const username = req.body.username;
  const password = req.body.password;

  // Check if entered credentials match the predefined credentials
  if (username === credentials.username && password === credentials.password) {
    // Insert data into MongoDB
    const data = {
      username: username,
      password: password
    };

    client.connect((err) => {
      if (err) {
        console.error('Failed to connect to MongoDB:', err);
        res.status(500).send('Failed to connect to MongoDB');
        return;
      }

      const db = client.db('admin'); // Replace with your MongoDB database name
      const collection = db.collection('admin'); // Replace with your MongoDB collection name

      collection.insertOne(data, (err) => {
        if (err) {
          console.error('Failed to insert data into MongoDB:', err);
          res.status(500).send('Failed to insert data into MongoDB');
        } else {
          res.send('Login successful! Data inserted into MongoDB.');
        }
      });
    });
  } else {
    res.send('Invalid username or password.');
    // Handle incorrect login attempts
  }
});

app.listen(3000, () => {
  console.log('Server started on port 3000');
});
