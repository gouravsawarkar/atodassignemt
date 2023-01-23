part of 'other_forecast_bloc.dart';

abstract class OtherForecastEvent extends Equatable {
  const OtherForecastEvent();

  @override
  List<Object> get props => [];
}

class GetOtherForcast extends OtherForecastEvent {
  String cityId, tocken;
  GetOtherForcast({required this.cityId, required this.tocken});
}
