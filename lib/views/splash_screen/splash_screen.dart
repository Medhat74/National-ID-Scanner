import 'dart:async';

import 'package:flutter/material.dart';
import '../../core/utils/naviagtion.dart';
import '../home_view/home_view.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    //SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Color(0xff1b233b),
      body: Center(
        child: SvgPicture.asset('assets/images/MAKlogo.svg'),
      ),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    AppNavigator.customNavigator(
        context: context, screen: HomeView(), finish: true);
  }
}
