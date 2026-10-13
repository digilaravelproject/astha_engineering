import 'package:dio/dio.dart';
import 'package:astha_engineering/features/admin/certificate_management/data/models/certificate_model.dart';

abstract class CertificateRemoteDataSource {
  Future<List<CertificateModel>> getCertificates();
}

class CertificateRemoteDataSourceImpl implements CertificateRemoteDataSource {
  final Dio dio;

  CertificateRemoteDataSourceImpl(this.dio);

  @override
  Future<List<CertificateModel>> getCertificates() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      CertificateModel(
        id: '1',
        equipmentId: '1',
        certificateNumber: 'CERT-2026-1000',
        issueDate: DateTime.now(),
        expiryDate: DateTime.now().add(const Duration(days: 365)),
        pdfUrl: 'https://example.com/cert1.pdf',
        status: 'Active',
        createdAt: DateTime.now(),
      ),
    ];
  }
}
