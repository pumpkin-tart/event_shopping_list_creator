const http = require('http');
const express = require('express');
const app = express();

console.log(process.env.DATABASE_URL);


const hostname = '127.0.0.1';
const port = process.env.PORT || 3000;


const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
});

app.get('/', (req, res) => {
  res.send('GET request to the homepage')
})


server.on('listening', () => {
  // ここで random port が取れる
  const port = server.address().port;
});

server.listen(process.env.PORT || 8000, "0.0.0.0", (err, address) => {
    if (err) throw err
    
})