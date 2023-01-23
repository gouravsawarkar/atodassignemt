import 'package:a_to_d_assignemt/models/loginDataModel.dart';
import 'package:a_to_d_assignemt/repositories/loginRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final loginRepo = LoginRepo();
  LoginBloc() : super(LoginLoading()) {
    on<Login>((event, emit) async {
      // TODO: implement event handler
      try {
        LoginDataModel data =
            await loginRepo.login(event.email, event.password);
        if (data.token.isNotEmpty) {
          emit(LoginDone(msg: data));
        } else {
          print('data');
          emit(LoginError(error: data.msg));
        }
      } catch (e) {
   print('data');
        emit(LoginError(error: e.toString()));
      }
    });
  }
}
