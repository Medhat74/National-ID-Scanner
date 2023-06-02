part of 'citizen_cubit.dart';

@immutable
abstract class CitizenState {}

class CitizenInitial extends CitizenState {}

class GetCitizenLoadingState extends CitizenState {}
class GetCitizenErrorState extends CitizenState {
  final error;

  GetCitizenErrorState({required this.error});
}
class GetCitizenSuccessState extends CitizenState {}
