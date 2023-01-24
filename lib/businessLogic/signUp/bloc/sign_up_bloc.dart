import 'package:a_to_d_assignemt/models/userModel.dart';
import 'package:a_to_d_assignemt/repositories/signUpRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final signupRepo = SignUpRepo();
  SignUpBloc() : super(SignUpLoading()) {
    on<SignUp>((event, emit) async {
      emit(SignUpLoading());
      try {
        UserDataModel data = await signupRepo.signUp(event.name, event.email,
            event.phone, event.password, event.country);
        print(data.status);
        if (data.status) {
          emit(SignUpDone(data: data));
        } else {
          emit(SignUpError(error: data.msg));
        }
      } catch (e) {
        emit(SignUpError(error: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
