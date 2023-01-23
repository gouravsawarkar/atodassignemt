part of 'forcast_bloc.dart';

abstract class ForcastEvent extends Equatable {
  const ForcastEvent();

  @override
  List<Object> get props => [];
}

class GetForeCast extends ForcastEvent {
  String cityId, tocken;
  GetForeCast({required this.cityId, required this.tocken});
}
