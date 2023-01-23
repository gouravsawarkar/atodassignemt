part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {}

class LoginDone extends LoginState {
  LoginDataModel msg;
  LoginDone({required this.msg});
  @override
  List<Object> get props => [msg];
}

class LoginError extends LoginState {
  String error;
  LoginError({required this.error});
  @override
  List<Object> get props => [error];
}
