part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUp extends SignUpEvent {
  String email, phone, name, password, country;
  SignUp({required this.country,required this.email,required this.name,required this.password,required this.phone});
}
