part of 'offices_bloc.dart';

abstract class OfficesState {}

class InitialState extends OfficesState {}

class LoadingState extends OfficesState {}

class LoadedState extends OfficesState {
  LoadedState({required this.officesList});
  final OfficesList officesList;
}

class FailureState extends OfficesState {
  FailureState({required this.exception});
  final Object? exception;
}
