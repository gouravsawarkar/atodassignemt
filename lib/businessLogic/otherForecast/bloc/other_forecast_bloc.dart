import 'package:a_to_d_assignemt/models/otherForcastModel.dart';
import 'package:a_to_d_assignemt/repositories/forcastRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'other_forecast_event.dart';
part 'other_forecast_state.dart';

class OtherForecastBloc extends Bloc<OtherForecastEvent, OtherForecastState> {
  final forcastRepo = Forcast();
  OtherForecastBloc() : super(OtherForecastInitial()) {
    on<GetOtherForcast>((event, emit)async {
       try {
        OtherForcastModel data =
            await forcastRepo.getOtherForcast(event.cityId, event.tocken);
        emit(OtherForecastLoaded(data: data));
      } catch (e) {
        emit(OtherForecastError(error: e.toString()));
      }// TODO: implement event handler

    });
  }
}
