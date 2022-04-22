import 'package:flutter/material.dart';
import 'package:sds_sample_flutter_prject/models/student_data.dart';
import 'package:sds_sample_flutter_prject/models/student_model.dart';

class ViewStudentScreen extends StatefulWidget {
  ViewStudentScreen({required this.studentResponse});
  final StudentResponse studentResponse;

  @override
  State<ViewStudentScreen> createState() => _ViewStudentScreenState();
}

class _ViewStudentScreenState extends State<ViewStudentScreen> {
  @override
  Widget build(BuildContext context) {
    TextStyle myTextStyle = TextStyle(fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        title: Text('View Student'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${widget.studentResponse.firstname}',
              style: myTextStyle,
            ),
            Text(
              '${widget.studentResponse.middlename}',
              style: myTextStyle,
            ),
            Text(
              '${widget.studentResponse.lastname}',
              style: myTextStyle,
            ),
            Text(
              '${widget.studentResponse.gender}',
              style: myTextStyle,
            ),
            Text(
              '${widget.studentResponse.age}',
              style: myTextStyle,
            ),
            Text(
              '${widget.studentResponse.address}',
              style: myTextStyle,
            ),
            Text(
              '${widget.studentResponse.course}',
              style: myTextStyle,
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
