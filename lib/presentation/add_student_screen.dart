import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:sds_sample_flutter_prject/list_bloc/list_bloc.dart';
import 'package:sds_sample_flutter_prject/list_bloc/list_state.dart';
import 'package:sds_sample_flutter_prject/models/student_data.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({Key? key}) : super(key: key);

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController middleNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                hintText: 'Please enter your first name',
                labelText: 'First Name',
              ),
            ),
            TextFormField(
              controller: middleNameController,
              decoration: const InputDecoration(
                hintText: 'Please enter your middle name',
                labelText: 'Middle Name',
              ),
            ),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                hintText: 'Please enter your last name',
                labelText: 'Last Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  String firstName = firstNameController.text;
                  String middleName = middleNameController.text;
                  String lastNameName = lastNameController.text;

                  StudentData studentData = StudentData(
                      firstName: firstName,
                      middleName: middleName,
                      lastName: lastNameName,
                      gender: 'sample string 4',
                      age: 100,
                      address: 'sample string 4',
                      course: 'sample string 4');
                  Navigator.of(context).pop(studentData);
                },
                child: Text('Add student'))
          ],
        ),
      ),
    );
  }
}

// {
//   "first_name": "sample string 1",
//   "last_name": "sample string 2",
//   "middle_name": "sample string 3",
//   "gender": "sample string 4",
//   "age": 5,
//   "address": "sample string 6",
//   "course": "sample string 7"
// }
