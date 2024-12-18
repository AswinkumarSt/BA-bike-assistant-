import 'package:flutter/material.dart';

class Himalayan450Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meteor 350'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: const Text(
          'Welcome to the Himalayan 450 Page!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
