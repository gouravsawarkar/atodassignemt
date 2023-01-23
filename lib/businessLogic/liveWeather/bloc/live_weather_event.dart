part of 'live_weather_bloc.dart';

abstract class LiveWeatherEvent extends Equatable {
  const LiveWeatherEvent();

  @override
  List<Object> get props => [];
}

class GetLiveWeather extends LiveWeatherEvent {
  String cityId;
  String tocken;
  GetLiveWeather({required this.cityId,required this.tocken});
}
