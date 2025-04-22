import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Text('You have been logged in. 😊'),
      ),
    );
  }
}
