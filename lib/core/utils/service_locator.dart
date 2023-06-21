import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pickytour/features/auth/data/auth_repo_implementation.dart';
import '../../features/categories/presentation/cities/data/cities_repo_impl.dart';
import 'api_service.dart';

final getIt= GetIt.instance;

void setupGetItService(){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AutheRepoImpl>(AutheRepoImpl());
  getIt.registerSingleton<CitiesRepoImpl>(CitiesRepoImpl( getIt.get<ApiService>() ));
}