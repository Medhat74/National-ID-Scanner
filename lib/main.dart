import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:makchain_gov/services/remote/dio/dio_helper.dart';
import 'package:makchain_gov/src/app_root.dart';

import 'blocs/observer/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(AppRoot());
BlocOverrides.runZoned(
    () {
      runApp(const AppRoot());
    },
    blocObserver: MyBlocObserver(),
  );

}
