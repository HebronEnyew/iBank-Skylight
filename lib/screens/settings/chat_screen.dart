import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ChatMessage {
  final List<InlineSpan> richText;
  final String timestamp;
  final bool isMe;

  ChatMessage({
    required this.richText,
    required this.timestamp,
    required this.isMe,
  });
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  late List<ChatMessage> _messages;

  @override
  void initState() {
    super.initState();
    _messages = [
      ChatMessage(
        timestamp: "8/10/2018",
        isMe: false,
        richText: [
          const TextSpan(
            text: "Did you attempt transaction on debit card ending in ",
          ),
          TextSpan(
            text: "0000",
            style: TextStyle(
              color: AppColors.primaryPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: " at Mechan1 in NJ for \$1,200? Reply YES or NO",
          ),
        ],
      ),
      ChatMessage(
        richText: [const TextSpan(text: "Yes")],
        timestamp: "",
        isMe: true,
      ),
      ChatMessage(
        timestamp: "8/10/2018",
        isMe: false,
        richText: [
          const TextSpan(text: "Bank of America : "),
          TextSpan(
            text: "256486",
            style: TextStyle(
              color: AppColors.primaryPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text:
                " is your authorization code which expires in 10 minutes. If you didn't request the code. Call : ",
          ),
          TextSpan(
            text: "18009898",
            style: TextStyle(
              color: AppColors.primaryPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(text: " for assistance"),
        ],
      ),
      ChatMessage(
        richText: [const TextSpan(text: "Thanks!")],
        timestamp: "",
        isMe: true,
      ),
    ];
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(
          ChatMessage(
            richText: [TextSpan(text: _messageController.text)],
            timestamp: "",
            isMe: true,
          ),
        );
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Bank of America",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return Column(
                  children: [
                    if (msg.timestamp.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          msg.timestamp,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                        ),
                      ),
                    _buildChatBubble(msg),
                  ],
                );
              },
            ),
          ),

          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildChatBubble(ChatMessage msg) {
    return Align(
      alignment: msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: msg.isMe ? AppColors.primaryPurple : const Color(0xFFF2F2F7),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft: msg.isMe ? const Radius.circular(15) : Radius.zero,
            bottomRight: msg.isMe ? Radius.zero : const Radius.circular(15),
          ),
        ),
        child: Text.rich(
          TextSpan(children: msg.richText),
          style: TextStyle(
            color: msg.isMe ? Colors.white : Colors.black87,
            fontSize: 15,
            height: 1.4,
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 15,
        bottom: MediaQuery.of(context).padding.bottom + 15,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              onSubmitted: (_) => _sendMessage(),
              decoration: InputDecoration(
                hintText: "Type something...",
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: AppColors.primaryPurple),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: _sendMessage,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xFFF2F2F7),
              child: Icon(Icons.arrow_forward, color: Colors.grey[300]),
            ),
          ),
        ],
      ),
    );
  }
}
