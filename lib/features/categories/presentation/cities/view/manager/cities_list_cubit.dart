import 'package:bloc/bloc.dart';
import 'package:pickytour/features/categories/presentation/cities/data/cities_repo.dart';
import 'package:pickytour/features/categories/presentation/cities/view/manager/cities_list_state.dart';

class CitiesListCubit extends Cubit<CitiesListState>{
  CitiesListCubit(this.citiesRepo): super(CitiesListInitial());
  CitiesRepo citiesRepo;
  Future<void> fetchCities()async{
    emit(CitiesListLoading());
    var result = await citiesRepo.fetchCities();
    result.fold((failure) {
      emit(CitiesListFailure(failure.errorMessage));
    }, (cities) {
      emit(CitiesListISuccess(cities));
    });
  }
}
