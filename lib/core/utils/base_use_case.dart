import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';

abstract class BaseUseCase<T , Parameters> {
  Future <Either<Failure,T>> call(Parameters parameters);
}

class NoParameters{
  NoParameters();
}