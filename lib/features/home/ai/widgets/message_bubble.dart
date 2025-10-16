import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../data/models/message_model.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return message.isUser
        ? Align(
            alignment: Alignment.centerRight,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 250),
              padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 4),
              decoration: const BoxDecoration(
                color: Color(0xFF82C0CB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                message.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
            ),
          )
        : Align(
            alignment: Alignment.centerLeft,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 341),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildIconButton(
                        context,
                        icon: Icons.copy,
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: message.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Copied to clipboard')),
                          );
                        },
                      ),
                      _buildIconButton(
                        context,
                        icon: Icons.thumb_up_alt_outlined,
                        onTap: () {},
                      ),
                      _buildIconButton(
                        context,
                        icon: Icons.thumb_down_alt_outlined,
                        onTap: () {},
                      ),
                      _buildIconButton(
                        context,
                        icon: Icons.refresh,
                        onTap: () {},
                      ),
                      _buildIconButton(
                        context,
                        icon: Icons.share_outlined,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }

  Widget _buildIconButton(BuildContext context,
      {required IconData icon, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Icon(icon, size: 12, color: const Color(0XFF9E9E9E)),
      ),
    );
  }
}
