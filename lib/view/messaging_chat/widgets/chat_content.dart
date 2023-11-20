import 'package:flutter/material.dart';

class ChatContent extends StatelessWidget {
  const ChatContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Placeholder(),
      ],
    );
  }

  Widget _sender() {
    return Container();
  }

  Widget _receiver() {
    return Container();
  }
}
