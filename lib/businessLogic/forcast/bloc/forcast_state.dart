part of 'forcast_bloc.dart';

abstract class ForcastState extends Equatable {
  const ForcastState();

  @override
  List<Object> get props => [];
}

class ForcastLoading extends ForcastState {}

class SmallForecastLoaded extends ForcastState {
  SmallForcastModel data;
  SmallForecastLoaded({required this.data});
  @override
  List<Object> get props => [data];
}

class OtherForcastLoaded extends ForcastState {
  OtherForcastModel data;
  OtherForcastLoaded({required this.data});
  @override
  List<Object> get props => [data];
}

class ForcastLoadingError extends ForcastState {
  String error;
  ForcastLoadingError({required this.error});
  @override
  List<Object> get props => [error];
}
