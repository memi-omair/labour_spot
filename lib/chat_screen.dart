import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: LabourspotChatScreen()));
}

class LabourspotChatScreen extends StatefulWidget {
  const LabourspotChatScreen({Key? key}) : super(key: key);

  @override
  State<LabourspotChatScreen> createState() => _LabourspotChatScreenState();
}

class _LabourspotChatScreenState extends State<LabourspotChatScreen> {
  final TextEditingController _textController = TextEditingController();
  List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Zubair Ahmed",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return messages[index];
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        labelText: "Type a message",
                        labelStyle: TextStyle(color: Colors.grey.shade300),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xff007BFF),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xff007BFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      setState(() {
                        messages.add(ChatMessage(
                          text: _textController.text,
                          username: 'User', // You can set the actual username here
                          isUser: true,
                        ));
                        _textController.clear();
                      });
                    }
                  },
                  icon: Icon(
                    Icons.send_sharp,
                    color: Colors.blueAccent,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final String username;
  final bool isUser;

  ChatMessage({
    required this.text,
    required this.username,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser)
            Container(
              margin: EdgeInsets.only(right: 16.0, left: 16.0),
              child: CircleAvatar(
                child: Text(username[0]),
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6,
                ),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: isUser ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.only(
                    topRight: isUser ? Radius.circular(15.0) : Radius.zero,
                    topLeft: !isUser ? Radius.circular(15.0) : Radius.zero,
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isUser ? Colors.white : Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                ),
              ),
            ],
          ),
          if (isUser)
            Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0),
              child: CircleAvatar(
                child: Text(username[0]),
              ),
            ),
        ],
      ),
    );
  }
}
