const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
  res.send('<h1>Hello from Multi-Stage Docker!</h1>');
});

app.listen(PORT, () => {
  console.log(`App running on http://localhost:${PORT}`);
});
