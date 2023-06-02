import 'package:flutter/material.dart';

import '../../../core/styles/texts/app_text_styles.dart';
import '../../../models/citizen_hub.dart';

class ElbetaqaComponent extends StatelessWidget {
  ElbetaqaComponent({Key? key, required this.citizen}) : super(key: key);
  final CitizenHub citizen;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // background
        Positioned(
            top: 0,
            width: MediaQuery.of(context).size.width,
            //height: 150,
            child: Image.asset(
              "assets/images/finalID.jpg",
            )),

        // column text
        Positioned(
          right: 5,
          top: 50,
          height: 160,
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                citizen.firstName!,
                style: AppTextStyle.title(),
              ),
              Text(
                citizen.familyName!,
                style: AppTextStyle.title(),
              ),
              Text(
                citizen.address!,
                style: AppTextStyle.title(),
              ),
              Text(
                citizen.subCity! + " - " + citizen.city!,
                style: AppTextStyle.title(),
              ),
              Text(
                citizen.id!,
                style: AppTextStyle.title(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
