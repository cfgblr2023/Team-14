const readline = require('readline');

// Predefined login credentials
const credentials = {
  username: 'admin',
  password: 'password123'
};

// Create interface for user input
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Prompt for username
rl.question('Username: ', (username) => {
  // Prompt for password
  rl.question('Password: ', (password) => {
    // Check if entered credentials match the predefined credentials
    if (username === credentials.username && password === credentials.password) {
      console.log('Login successful!');
      // Perform additional actions or redirect to a logged-in page
    } else {
      console.log('Invalid username or password.');
      // Handle incorrect login attempts
    }

    // Close the readline interface
    rl.close();
  });
});
