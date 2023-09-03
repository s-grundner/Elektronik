/**
 * @author @s-grundner
 * @date 2023-01-19
 * @brief UDP server
 * @see http://nodejs.org/api/dgram.html
 * @see http://www.w3schools.com/nodejs/nodejs_net.asp
 * @see http://www.w3schools.com/nodejs/nodejs_net_udp.asp
 * @see http://www.w3schools.com/nodejs/nodejs_net_createconnection.asp
 */

var dgram = require("dgram");
var server = dgram.createSocket("udp4");

/**
 * @brief Handle server events
 * @see http://nodejs.org/api/dgram.html#dgram_event_message
 */
server.on("error", function (err) {
  console.log("server error:\n" + err.stack);
  server.close();
});

server.on("message", function (msg, rinfo) {
  console.log("server got: " + msg + " from " +
    rinfo.address + ":" + rinfo.port);
});

server.on("listening", function () {
  var address = server.address();
  console.log("server listening " +
    address.address + ":" + address.port);
});

/**
 * @brief Bind server to port
 * @see http://nodejs.org/api/dgram.html#dgram_socket_bind_port_address_callback
 */
server.bind(8888);
// server listening 0.0.0.0:41234