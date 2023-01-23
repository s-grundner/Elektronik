/**
 * @author @s-grundner
 * @date 2023-01-19
 * @brief UDP client
 * @see http://nodejs.org/api/dgram.html
 * @see http://www.w3schools.com/nodejs/nodejs_net.asp
 * @see http://www.w3schools.com/nodejs/nodejs_net_udp.asp
 * @see http://www.w3schools.com/nodejs/nodejs_net_createconnection.asp
 */

var dgram = require('dgram');
var message = new Buffer.from("This is a message from client...", "utf-8");
var client = dgram.createSocket("udp4");

/**
 * @brief Send message to server
 * @see http://nodejs.org/api/dgram.html#dgram_socket_send_msg_offset_length_port_address_callback
 */
client.send(message, 0, message.length, 8888, "127.0.0.1", function (err, bytes) {
  client.close();
});