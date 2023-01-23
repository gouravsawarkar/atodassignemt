part of 'city_list_bloc.dart';

abstract class CityListEvent extends Equatable {
  const CityListEvent();

  @override
  List<Object> get props => [];
}

class GetCityList extends CityListEvent {
  String tocken;
  GetCityList({required this.tocken});
}
