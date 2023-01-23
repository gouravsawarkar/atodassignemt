import 'package:a_to_d_assignemt/models/liveWeatherModel.dart';
import 'package:a_to_d_assignemt/repositories/liveWheatherRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'live_weather_event.dart';
part 'live_weather_state.dart';

class LiveWeatherBloc extends Bloc<LiveWeatherEvent, LiveWeatherState> {
  final liveWeatherRepo = LiveWeatherRepo();
  LiveWeatherBloc() : super(LiveWeatherInitialLoading()) {
    on<GetLiveWeather>((event, emit) async {
      emit(LiveWeatherInitialLoading());
      try {
        LiveWeatherModel data =
            await liveWeatherRepo.getLiveWeather(event.cityId,event.tocken);
        emit(LiveWeatherLoaded(data: data));
      } catch (e) {
        emit(LiveWeatherError(error: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
