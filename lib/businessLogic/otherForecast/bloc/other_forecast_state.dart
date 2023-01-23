part of 'other_forecast_bloc.dart';

abstract class OtherForecastState extends Equatable {
  const OtherForecastState();

  @override
  List<Object> get props => [];
}

class OtherForecastInitial extends OtherForecastState {}

class OtherForecastLoaded extends OtherForecastState {
  OtherForcastModel data;
  OtherForecastLoaded({required this.data});
  @override
  List<Object> get props => [data];
}

class OtherForecastError extends OtherForecastState {
  String error;
  OtherForecastError({required this.error});
  @override
  List<Object> get props => [error];
}
