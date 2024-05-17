import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late WebSocketChannel channel;

  void connect(String channelId) {
    channel = IOWebSocketChannel.connect('ws://12.0.0.1:6001');
    channel.sink.add(jsonEncode({'type': 'join', 'channel': channelId}));
  }

  void sendMessage(String channelId, String message) {
    channel.sink.add(jsonEncode(
        {'type': 'message', 'channel': channelId, 'message': message}));
  }

  void disconnect() {
    channel.sink.close();
  }
}
