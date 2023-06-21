
import 'package:pickytour/core/city_model/CityModel.dart';

abstract class CitiesListState{
  const CitiesListState();
}

class CitiesListInitial extends CitiesListState{}
class CitiesListLoading extends CitiesListState{}
class CitiesListISuccess extends CitiesListState{
  final List<CityModel> citiesList;

  const CitiesListISuccess(this.citiesList);
}
class CitiesListFailure extends CitiesListState{
  final String errorMessage;

  const CitiesListFailure(this.errorMessage);
}