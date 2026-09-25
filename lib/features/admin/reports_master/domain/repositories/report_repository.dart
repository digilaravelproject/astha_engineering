import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/reports_master/domain/entities/report_entity.dart';

abstract class ReportRepository {
  Future<Either<Failure, List<ReportEntity>>> getReports();
  Future<Either<Failure, ReportEntity>> generateReport({
    required String reportType,
    required DateTime fromDate,
    required DateTime toDate,
    String? customerId,
    String? siteId,
  });
}
