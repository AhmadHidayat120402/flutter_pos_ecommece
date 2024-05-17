import 'package:flutter/material.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/auth_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'web_socket_service.dart';

class ChatScreen extends StatefulWidget {
  final String channelId;

  ChatScreen({required this.channelId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final WebSocketService _webSocketService = WebSocketService();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _connect();
  }

  void _connect() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final token = authData?.accessToken;
    if (token != null) {
      _webSocketService.connect(widget.channelId);
    }
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _webSocketService.sendMessage(widget.channelId, _controller.text);
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _webSocketService.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _webSocketService.channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // Tangani pesan masuk
                }
                return ListView();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Enter message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
