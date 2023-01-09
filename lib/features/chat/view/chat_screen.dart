import 'package:flutter/material.dart';
import 'package:mobile/features/chat/view/components/chat_header.dart';
import 'package:mobile/features/chat/view/components/chat_input.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ChatHeader(),
            Flexible(child: Container()),
            const ChatInput(),
          ],
        ),
      ),
    );
  }
}
