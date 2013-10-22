var express = require('express')
  , app = express()
  , server = require('http').createServer(app)
  , io = require('socket.io').listen(server);
 
server.listen(3456);
 
app.configure(function(){
 app.use(express.static('static'));
 app.use(express.logger());
 app.use(express.bodyParser());
});
 
/*app.get('/', function(req, res){
 // index.html に、iPhoneで表示するボタンやスライダーを配置
 //res.sendfile(__dirname + '/index.html');
 res.send('Active');
});*/
 
// シリアルポートの準備
var serialport = require('serialport');
var SerialPort = serialport.SerialPort;
var sp = new SerialPort('/dev/tty.usbserial-AE01CQBA', {
 parser: serialport.parsers.readline('\r\n')
});
 
io.sockets.on('connection', function(socket){
 // iPhoneからWebSocketのパケットが来たら……
 socket.on('value', function(data) {
 	console.log(data);

  // 書き込みデータをつくって
  //var xbeewrite = [data.state.charCodeAt(0), Math.pow(2,data.value)-1];
  // XBeeに送信
  //sp.write(xbeewrite);
 });
});