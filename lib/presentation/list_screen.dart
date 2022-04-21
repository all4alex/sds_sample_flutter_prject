import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sds_sample_flutter_prject/list_bloc/list_bloc.dart';
import 'package:sds_sample_flutter_prject/list_bloc/list_state.dart';
import 'package:sds_sample_flutter_prject/models/student_data.dart';
import 'package:sds_sample_flutter_prject/models/student_model.dart';
import 'package:sds_sample_flutter_prject/presentation/add_student_screen.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<StudentResponse> studentList = [];

  @override
  void initState() {
    context.read<ListBloc>().getStudentList();
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
          if (state is AddStudentSuccessState) {
            context.read<ListBloc>().getStudentList();
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
                            print('ITEM: $index');
                          },
                          child: Text('${studentList[index].firstname}'),
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
          context.read<ListBloc>().addStudent(studentData: studentData);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {});
  }
}
