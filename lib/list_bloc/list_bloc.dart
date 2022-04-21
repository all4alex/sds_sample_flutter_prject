import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sds_sample_flutter_prject/api/api_service.dart';
import 'package:sds_sample_flutter_prject/list_bloc/list_state.dart';
import 'package:sds_sample_flutter_prject/models/student_model.dart';

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

    List<StudentResponse> studentList = await _apiService.getStudentList();

    emit(SuccessListState(studentList: studentList));
  }
}
