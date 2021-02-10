'use strict';

const express = require('express');

// Constants
const PORT = 80;
const HOST = '0.0.0.0';

// App
const app = express();
// app.get('/', (req, res) => {
//   res.send('Hello William Hill, this is EJ');
// });

var h0st;
// const port;

app.get('/', (req, res) => {
 h0st = req.hostname;
res.send(`Hello Hello User, this is ${h0st}:3007`);
  console.log(response);
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);