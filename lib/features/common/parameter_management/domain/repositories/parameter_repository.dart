import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/common/parameter_management/domain/entities/parameter_entity.dart';

abstract class ParameterRepository {
  Future<Either<Failure, List<ParameterEntity>>> getParameters(String parameterType);
  Future<Either<Failure, void>> addParameter(ParameterEntity parameter);
  Future<Either<Failure, void>> updateParameter(ParameterEntity parameter);
  Future<Either<Failure, void>> deleteParameter(String id);
}
