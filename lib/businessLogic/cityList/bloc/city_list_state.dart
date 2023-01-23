part of 'city_list_bloc.dart';

abstract class CityListState extends Equatable {
  const CityListState();

  @override
  List<Object> get props => [];
}

class CityListLoading extends CityListState {}

class CityListLoaded extends CityListState {
  CityListModel data;
  CityListLoaded({required this.data});
  @override
  List<Object> get props => [data];
}

class CityListError extends CityListState {
  String error;
  CityListError({required this.error});
  @override
  List<Object> get props => [error];
}
