import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'city_index_state.dart';

class CityIndexCubit extends Cubit<CityIndexState> {
  CityIndexCubit() : super(CityIndexInitial());
  void cityIndex(index) => emit(CityIndexLoaded(index: index));
}
