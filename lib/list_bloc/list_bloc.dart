import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sds_sample_flutter_prject/api/api_service.dart';
import 'package:sds_sample_flutter_prject/list_bloc/list_state.dart';
import 'package:sds_sample_flutter_prject/models/student_data.dart';
import 'package:sds_sample_flutter_prject/models/student_model.dart';
import 'package:sds_sample_flutter_prject/models/update_student_data.dart';

class ListBloc extends Cubit<ListState> {
  ListBloc() : super(InitialState());
  ApiService _apiService = ApiService();

  // void getSuccess({required int listCOunt}) async {
  //   emit(LoadingListState());
  //   await Future.delayed(Duration(seconds: 3));
  //   emit(SuccessListState(listCOunt));
  // }

  void getFail({required int listCOunt}) async {
    emit(LoadingListState());
    await Future.delayed(Duration(seconds: 3));
    emit(FailedListState());
  }

  void getStudentList() async {
    emit(LoadingListState());
    List<StudentResponse> activeStudentList = [];

    List<StudentResponse> studentList = await _apiService.getStudentList();
    for (StudentResponse student in studentList) {
      if (student.isActive!) {
        activeStudentList.add(student);
      }
    }
    emit(SuccessListState(studentList: activeStudentList));
  }

  void addStudent({required StudentData studentData}) async {
    emit(AddStudentLoadingState());
    bool success = await _apiService.addStudent(studentData: studentData);
    if (success) {
      emit(AddStudentSuccessState());
    } else {
      emit(AddStudentFailedState());
    }
  }

  void updateStudent(
      {required UpdateStudentData updateStudentData,
      required String id}) async {
    emit(UpdateStudentLoadingState());
    bool success = await _apiService.updateStudent(
        updateStudentData: updateStudentData, id: id);
    if (success) {
      emit(UpdateStudentSuccessState());
    } else {
      emit(UpdateStudentFailedState());
    }
  }

  void deleteStudent({required String id}) async {
    emit(UpdateStudentLoadingState());
    bool success = await _apiService.deleteStudent(isActive: false, id: id);
    if (success) {
      emit(UpdateStudentSuccessState());
    } else {
      emit(UpdateStudentFailedState());
    }
  }
}
