import 'package:flutter/material.dart';

class StatefulScreen extends StatefulWidget {
  @override
  State<StatefulScreen> createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  late int count;
  double height = 200;
  double width = 200;
  double opacity = 1.0;

  @override
  void initState() {
    count = 0;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('TRIGGERED');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('STATEFUL'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$count',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 50),
            AnimatedOpacity(
                opacity: opacity,
                duration: Duration(milliseconds: 500),
                child: Container(
                  height: height,
                  width: width,
                  color: Colors.pink[900],
                )),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    // height = 400;
                    // width = 400;
                    opacity = 0.2;
                  });
                },
                child: Text('Animated')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    // height = 200;
                    // width = 200;
                    opacity = 1.0;
                  });
                },
                child: Text('Reduce'))
          ],
        ),
      ),
    );
  }

  Function()? handleMin() {
    if (count == 0) {
      return null;
    } else {
      return () => setState(() {
            count--;
          });
    }
  }

  bool isMinReached() => count == 0;
  bool isMaxReached() => count == 10;
}
