import 'package:flutter/material.dart';
import 'package:flutter_chat_app/ChatMessage.dart';
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final List<ChatMessage> _messages = <ChatMessage> [];

  final TextEditingController _textEditingController = new TextEditingController();




  void _handleSubmitted(String text)
  {

      _textEditingController.clear();
      ChatMessage chatMessage = new ChatMessage(text);
      setState(() {
        _messages.insert(0, chatMessage);
      });
  }


  void _pressedSendButton()
  {
    _handleSubmitted(_textEditingController.text);
  }


  Widget _textComposeWidget()
  {
    return new IconTheme(
        data:  new IconThemeData(color: Colors.blue),
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
            child: new TextField(
              controller: _textEditingController,
              onSubmitted: _handleSubmitted,
              decoration: new InputDecoration.collapsed(
                  hintText: "Send a message"

              ),
            ),
          ),
          new Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
              icon: new Icon(Icons.send),
              onPressed: _pressedSendButton,
            ),
          )
        ],
      ),
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_,int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposeWidget() ,
        )
      ],
    );
  }
}
