var http = require('http');
var url = require('url');

http.createServer(function (req, res) {
  var url_parts = url.parse(req.url, true);

  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World: ' + url_parts.query.name + '\n');
}).listen(1337, '127.0.0.1');
console.log('Server running at http://127.0.0.1:1337/');
