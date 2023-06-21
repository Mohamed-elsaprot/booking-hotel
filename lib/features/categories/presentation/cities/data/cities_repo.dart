import 'package:dartz/dartz.dart';
import 'package:pickytour/core/city_model/CityModel.dart';
import 'package:pickytour/core/errors/failure.dart';

abstract class CitiesRepo{
  Future<Either<Failure,List<CityModel>>>fetchCities();
}