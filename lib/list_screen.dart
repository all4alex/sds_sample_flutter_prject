import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sds_sample_flutter_prject/list_bloc/list_bloc.dart';
import 'package:sds_sample_flutter_prject/list_bloc/list_state.dart';
import 'package:sds_sample_flutter_prject/models/student_model.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<StudentResponse> studentList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asdasd'),
      ),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          if (state is LoadingListState) {
            return CircularProgressIndicator();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ListBloc>().getStudentList();
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
