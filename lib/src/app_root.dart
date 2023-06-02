import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makchain_gov/blocs/citzen_cubit/citizen_cubit.dart';
import 'package:makchain_gov/views/splash_screen/splash_screen.dart';


import '../core/styles/themes/light_theme.dart';
import '../views/home_view/home_view.dart';


class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CitizenCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, widget) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightMode,
          home:  SplashView(),
        ),
      ),
    );
  }
}
