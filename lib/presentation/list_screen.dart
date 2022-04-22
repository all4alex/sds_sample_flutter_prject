import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sds_sample_flutter_prject/list_bloc/list_bloc.dart';
import 'package:sds_sample_flutter_prject/list_bloc/list_state.dart';
import 'package:sds_sample_flutter_prject/models/student_data.dart';
import 'package:sds_sample_flutter_prject/models/student_model.dart';
import 'package:sds_sample_flutter_prject/models/update_student_data.dart';
import 'package:sds_sample_flutter_prject/presentation/add_student_screen.dart';
import 'package:sds_sample_flutter_prject/presentation/update_student_screen.dart';
import 'package:sds_sample_flutter_prject/presentation/view_student_screen.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<StudentResponse> studentList = [];
  late ListBloc listBloc;

  @override
  void initState() {
    listBloc = BlocProvider.of<ListBloc>(context);
    listBloc.getStudentList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: BlocListener<ListBloc, ListState>(
        listener: (context, state) {
          if (state is AddStudentSuccessState ||
              state is UpdateStudentSuccessState) {
            listBloc.getStudentList();
          }
        },
        child: BlocBuilder<ListBloc, ListState>(
          builder: (context, state) {
            if (state is LoadingListState || state is AddStudentLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FailedListState) {
              return Text('Something went wrong!');
            } else if (state is SuccessListState) {
              studentList = state.studentList;
            }

            return Container(
                padding: EdgeInsets.all(10),
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<ListBloc>().getStudentList();
                  },
                  child: ListView.separated(
                    itemCount: studentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 30,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewStudentScreen(
                                        studentResponse: studentList[index],
                                      )),
                            );
                          },
                          child: ListTile(
                            title: Text('${studentList[index].firstname}'),
                            trailing: Container(
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: IconButton(
                                        onPressed: () async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateStudentScreen(
                                                      studentResponse:
                                                          studentList[index],
                                                      onUpdateBtnClicked:
                                                          (UpdateStudentData
                                                                  updateStudentData,
                                                              String id) {
                                                        Navigator.of(context)
                                                            .pop();

                                                        listBloc.updateStudent(
                                                            updateStudentData:
                                                                updateStudentData,
                                                            id: id);
                                                      },
                                                    )),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                        )),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        listBloc.deleteStudent(
                                            id: studentList[index]
                                                .id
                                                .toString());
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  ),
                ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // context.read<ListBloc>().getStudentList();
          StudentData studentData = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddStudentScreen()),
          );
          print(studentData.toJson().toString());
          listBloc.addStudent(studentData: studentData);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
