import 'package:a_to_d_assignemt/models/otherForcastModel.dart';
import 'package:a_to_d_assignemt/models/smallForcastModel.dart';
import 'package:a_to_d_assignemt/repositories/forcastRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forcast_event.dart';
part 'forcast_state.dart';

class ForcastBloc extends Bloc<ForcastEvent, ForcastState> {
  final forcastRepo = Forcast();
  ForcastBloc() : super(ForcastLoading()) {
    on<GetForeCast>((event, emit) async {
      // TODO: implement event handler
      emit(ForcastLoading());
      try {
        SmallForcastModel data =
            await forcastRepo.getSmallForcast(event.cityId, event.tocken);
        emit(SmallForecastLoaded(data: data));
      } catch (e) {
        emit(ForcastLoadingError(error: e.toString()));
      }
    });
  }
}
