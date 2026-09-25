import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/common/parameter_management/domain/entities/parameter_entity.dart';

abstract class ParameterRepository {
  Future<Either<Failure, List<ParameterEntity>>> getParameters(String parameterType);
  Future<Either<Failure, void>> addParameter(ParameterEntity parameter);
  Future<Either<Failure, void>> updateParameter(ParameterEntity parameter);
  Future<Either<Failure, void>> deleteParameter(String id);
}
