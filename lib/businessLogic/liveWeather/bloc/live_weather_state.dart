part of 'live_weather_bloc.dart';

abstract class LiveWeatherState extends Equatable {
  const LiveWeatherState();

  @override
  List<Object> get props => [];
}

class LiveWeatherInitialLoading extends LiveWeatherState {}

class LiveWeatherLoaded extends LiveWeatherState {
  LiveWeatherModel data;
  LiveWeatherLoaded({required this.data});
  @override
  List<Object> get props => [data];
}

class LiveWeatherError extends LiveWeatherState {
  String error;
  LiveWeatherError({required this.error});
  @override
  List<Object> get props => [];
}
