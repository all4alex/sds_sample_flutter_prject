import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.appBartTitle});
  final String appBartTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('asdasd'),
        ),
        body: Container(
          child: Text('aiuhsdouhasdouhuoas'),
        ));
  }
}

// State management
// - StatelessWidget and StatefulWidget
// - Updating state
// - StatefulWidget lifescycle
