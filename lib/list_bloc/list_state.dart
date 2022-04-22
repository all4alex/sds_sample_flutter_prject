import 'package:equatable/equatable.dart';
import 'package:sds_sample_flutter_prject/models/student_model.dart';

abstract class ListState extends Equatable {
  const ListState();

  @override
  List<Object> get props => [];
}

class InitialState extends ListState {}

//student list states
class LoadingListState extends ListState {}

class SuccessListState extends ListState {
  SuccessListState({required this.studentList});
  final List<StudentResponse> studentList;
}

class FailedListState extends ListState {}

//add student states
class AddStudentLoadingState extends ListState {}

class AddStudentSuccessState extends ListState {
  AddStudentSuccessState();
}

class AddStudentFailedState extends ListState {}

//update student states
class UpdateStudentLoadingState extends ListState {}

class UpdateStudentSuccessState extends ListState {
  UpdateStudentSuccessState();
}

class UpdateStudentFailedState extends ListState {}
