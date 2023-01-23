part of 'city_index_cubit.dart';

abstract class CityIndexState extends Equatable {
  const CityIndexState();

  @override
  List<Object> get props => [];
}

class CityIndexInitial extends CityIndexState {}

class CityIndexLoaded extends CityIndexState {
  int index;
  CityIndexLoaded({required this.index});
  @override
  List<Object> get props => [index];
}
