import 'package:flutter/material.dart';
import 'package:sds_sample_flutter_prject/stateful_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StatefulScreen(),
    );
  }
}
