import 'dart:convert';

import 'package:sds_sample_flutter_prject/models/student_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var client = http.Client();

  Future<List<StudentResponse>> getStudentList() async {
    List<StudentResponse> studentList = [];
    try {
      var response = await client.get(
          Uri.parse('https://svc.devsolutions.sds.dev/api/students'),
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5Ijoic2RzIiwiYXBpX3NlY3JldCI6InNkc3NlY3JldCIsInVzZXJpZCI6IjEiLCJuYmYiOjE2NTA1MjU1NzUsImV4cCI6MTY1MDU0MzU3NSwiaWF0IjoxNjUwNTI1NTc1fQ.59A0Dvxsw-rUNxqxgufz9iWShw3VmN2HY0_TnDj9bS0'
          });
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        studentList =
            jsonResponse.map((e) => StudentResponse.fromJson(e)).toList();
      } else {
        studentList = [];
      }
    } catch (_) {}
    return studentList;
  }
}
