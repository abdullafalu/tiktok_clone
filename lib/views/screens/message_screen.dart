import 'package:flutter/material.dart';

class MessageScreeen extends StatelessWidget {
  const MessageScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Coming Soon...',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.red,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
