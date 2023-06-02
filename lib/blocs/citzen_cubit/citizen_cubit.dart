import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makchain_gov/models/citizen_hub.dart';
import 'package:makchain_gov/services/remote/dio/dio_helper.dart';
import 'package:meta/meta.dart';

import '../../services/remote/dio/end_points.dart';

part 'citizen_state.dart';

class CitizenCubit extends Cubit<CitizenState> {
  CitizenCubit() : super(CitizenInitial());
  static CitizenCubit get(context)=>BlocProvider.of(context);

  CitizenHub? citizen;

  void getCitizen(String citizenToken){
    citizen = CitizenHub();
    GetCitizenLoadingState();
    debugPrint("loading....");
    DioHelper.getData(url: BASE_URL).then((value) {
      debugPrint("Success....");
      debugPrint(value.toString());

      //Todo:: Call the constructor
      GetCitizenSuccessState();
    }).catchError((e){
      debugPrint(e.toString());
      GetCitizenErrorState(error: e);
    });
  }

}
