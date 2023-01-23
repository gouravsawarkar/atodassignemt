part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpDone extends SignUpState {
  late UserDataModel data;
  SignUpDone({required this.data});
  @override
  List<Object> get props => [data];
}

class SignUpError extends SignUpState {
  late String error;
  SignUpError({required this.error});
  @override
  List<Object> get props => [error];
}
