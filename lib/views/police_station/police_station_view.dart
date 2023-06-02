import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makchain_gov/blocs/citzen_cubit/citizen_cubit.dart';
import 'package:makchain_gov/core/styles/texts/app_text_styles.dart';

import '../../core/utils/naviagtion.dart';
import '../home_view/home_view.dart';
import 'Component/elbetaqa_component.dart';

class PoliceStationView extends StatelessWidget {
  const PoliceStationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        AppNavigator.customNavigator(context: context, screen: HomeView(), finish: true);
        return true;
      },
      child: Scaffold(
        //backgroundColor: Colors.lightBlue[300],
        appBar: AppBar(
          title: Center(
              child: Text(
                "بيانات المواطن",
                style: AppTextStyle.headLine(),
              )),
          backgroundColor: Color(0xff02204c),
        ),

        body: SafeArea(
          child: BlocConsumer<CitizenCubit,CitizenState>(
            listener: (context, state){},
            builder: (context,state){
              var cubit = CitizenCubit.get(context);
              return Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.32,
                    child: ElbetaqaComponent(citizen: cubit.citizen!,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("الاحوال الجنائية", style: AppTextStyle.headLine(),),

                      ],
                    ),
                  ),
                  Image.asset("assets/images/dakhelia.png"),
                  SizedBox(height: 10,),
                  Text(cubit.citizen!.crime! , style: AppTextStyle.title(),)


                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
