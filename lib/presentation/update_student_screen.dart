import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:sds_sample_flutter_prject/list_bloc/list_bloc.dart';
import 'package:sds_sample_flutter_prject/list_bloc/list_state.dart';
import 'package:sds_sample_flutter_prject/models/student_data.dart';
import 'package:sds_sample_flutter_prject/models/student_model.dart';
import 'package:sds_sample_flutter_prject/models/update_student_data.dart';

class UpdateStudentScreen extends StatefulWidget {
  UpdateStudentScreen(
      {required this.studentResponse, required this.onUpdateBtnClicked});
  final StudentResponse studentResponse;
  final Function(UpdateStudentData, String) onUpdateBtnClicked;
  @override
  State<UpdateStudentScreen> createState() => _UpdateStudentScreenState();
}

class _UpdateStudentScreenState extends State<UpdateStudentScreen> {
  late TextEditingController firstNameController;
  late TextEditingController middleNameController;
  late TextEditingController lastNameController;

  @override
  void initState() {
    firstNameController =
        TextEditingController(text: widget.studentResponse.firstname);
    middleNameController =
        TextEditingController(text: widget.studentResponse.middlename);
    lastNameController =
        TextEditingController(text: widget.studentResponse.lastname);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Student'),
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

                  UpdateStudentData studentData = UpdateStudentData(
                      firstName: firstName,
                      middleName: middleName,
                      lastName: lastNameName,
                      gender: widget.studentResponse.gender,
                      age: 100,
                      address: widget.studentResponse.address,
                      course: widget.studentResponse.course,
                      isActive: widget.studentResponse.isActive);

                  widget.onUpdateBtnClicked(
                      studentData, widget.studentResponse.id.toString());
                },
                child: Text('Update'))
          ],
        ),
      ),
    );
  }
}
