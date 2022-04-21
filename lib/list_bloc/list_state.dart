import 'package:equatable/equatable.dart';
import 'package:sds_sample_flutter_prject/models/student_model.dart';

abstract class ListState extends Equatable {
  const ListState();

  @override
  List<Object> get props => [];
}

class InitialState extends ListState {}

class LoadingListState extends ListState {}

class SuccessListState extends ListState {
  SuccessListState({required this.studentList});
  final List<StudentResponse> studentList;
}

class FailedListState extends ListState {}
