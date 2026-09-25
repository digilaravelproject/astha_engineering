import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/certificate_management/data/datasources/certificate_remote_data_source.dart';
import 'package:safecheck_techno/features/admin/certificate_management/domain/entities/certificate_entity.dart';
import 'package:safecheck_techno/features/admin/certificate_management/domain/repositories/certificate_repository.dart';

class CertificateRepositoryImpl implements CertificateRepository {
  final CertificateRemoteDataSource remoteDataSource;

  CertificateRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CertificateEntity>>> getCertificates() async {
    try {
      final remoteCertificates = await remoteDataSource.getCertificates();
      return Right(remoteCertificates);
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch certificates'));
    }
  }
}
