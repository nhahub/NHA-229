import 'package:flutter/material.dart';
import 'package:mostawak/core/widgets/custom_drawer.dart';
import 'package:mostawak/data/models/user_model.dart';
import '../../challenges/widgets/reusable_appbar.dart';
import '../widgets/message_bubble.dart';
import '../../../../data/models/message_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<MessageModel> messages = [];
  final TextEditingController _controller = TextEditingController();

  bool isUserTurn = true;
  final UserModel user = UserModel(name: "Omar");

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add(MessageModel(text: text, isUser: isUserTurn));
      isUserTurn = !isUserTurn;
    });

    _controller.clear();
  }

  void _sendAiMessage() {
    setState(() {
      messages.add(
        MessageModel(text: "🎤 Sensei is listening...", isUser: false),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReusableAppBar(
        centerImage: 'assets/images/chatwithai.svg',
        showTabs: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 23),
          child: Column(
            children: [
              const SizedBox(height: 102),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: messages.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Hi, ${user.name}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'Poppins',
                                  color: Color(0xff82C0CB),
                                ),
                              ),
                              const Text(
                                'What challenge will you tackle next?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  color: Color(0xff82C0CB),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message = messages[index];
                            return MessageBubble(message: message);
                          },
                        ),
                ),
              ),
              Container(
                width: 358,
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(color: const Color(0xFF9E9E9E), width: 1.2),
                  color: Colors.transparent,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.add, color: Color(0xFF9E9E9E), size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Ask Sensei',
                          hintStyle: TextStyle(
                            color: Color(0xFF9E9E9E),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                        cursorColor: const Color(0xFF9E9E9E),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.mic_none,
                        color: Color(0xFF9E9E9E),
                        size: 20,
                      ),
                      onPressed: _sendAiMessage,
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(
                        Icons.send_rounded,
                        color: Color(0xFF9E9E9E),
                        size: 20,
                      ),
                      onPressed: _sendMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
