import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sds_sample_flutter_prject/app.dart';

import 'list_bloc/list_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ListBloc(),
    child: App(),
  ));
}
