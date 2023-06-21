import 'package:dartz/dartz.dart';
import 'package:pickytour/core/errors/failure.dart';

abstract class AutheRepo{
  Future<Either<Failure,Map>>Authentication({required String email,required String password,required bool login});
}