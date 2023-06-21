import 'package:dartz/dartz.dart';
import 'package:pickytour/core/errors/failure.dart';
import 'package:pickytour/core/utils/api_service.dart';
import 'package:pickytour/features/categories/presentation/cities/data/cities_repo.dart';
import '../../../../../core/city_model/CityModel.dart';

class CitiesRepoImpl implements CitiesRepo{
  const CitiesRepoImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<Either<Failure, List<CityModel>>> fetchCities()async {
    try{
       var res = await apiService.get(endPointUrl: 'cities.json');
       print('--------------------');
       print(res);
      List<CityModel> cities=[];
       for(var i in res['items']){
         cities.add(CityModel.fromJson(i));
       }
      return right(cities);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }
}
