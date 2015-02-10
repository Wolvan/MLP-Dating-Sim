console.log("Starting Wolvan's MLPDS Test Server");
var net = require('net');

var connections = [];

var server = net.createServer(function (socket) {
	socket.on("data", function(data) {
		process.stdout.write("MLPDS sends data: " + data.toString() + "\nCMD>");
	});
	socket.pipe(socket);
});

server.on("connection", function(socket) {
	connections.push(socket);
})

server.listen(31325, '127.0.0.1');

var readline = require('readline'), rl = readline.createInterface(process.stdin, process.stdout);

rl.setPrompt('CMD>');
rl.prompt();

rl.on('line', function(line) {
	connections.forEach(function(socket) {
		socket.write(line.trim() + "\n");
	});
	rl.prompt();
}).on('close', function() {
	console.log('Have a great day!');
	process.exit(0);
});