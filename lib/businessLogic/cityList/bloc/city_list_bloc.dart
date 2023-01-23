import 'package:a_to_d_assignemt/models/cityListModel.dart';
import 'package:a_to_d_assignemt/repositories/cityListRepo.dart';
import 'package:a_to_d_assignemt/repositories/forcastRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'city_list_event.dart';
part 'city_list_state.dart';

class CityListBloc extends Bloc<CityListEvent, CityListState> {

  final cityRepo = CityListRepo();
  CityListBloc() : super(CityListLoading()) {
    on<GetCityList>((event, emit) async {
      emit(CityListLoading());
      try {
        var data = await cityRepo.getCityList(event.tocken);
        emit(CityListLoaded(data: data));
      } catch (e) {
        emit(CityListError(error: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
