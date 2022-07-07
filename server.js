const http = require('http');

const hostname = '127.0.0.1';
const port = process.env.PORT || 3000;


const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end();
});


server.on('listening', () => {
  // ここで random port が取れる
  const port = server.address().port;
});

server.listen(process.env.PORT || 8000, "0.0.0.0", (err, address) => {
    if (err) throw err
    
})