class ResponseModel {
  final bool isSuccess;
  final String message;
  final int? statusCode;
  final dynamic body;
  final List<dynamic>? errors;

  const ResponseModel({
    required this.isSuccess,
    required this.message,
    this.statusCode,
    this.body,
    this.errors,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json, {int? statusCode}) {
    final res = json['res']?.toString().toLowerCase();
    final status = json['status']?.toString().toLowerCase();
    final bool isSuccess = res == 'success' || status == 'success' || json['success'] == true || json.containsKey('auth');
    
    return ResponseModel(
      isSuccess: isSuccess,
      message: json['msg']?.toString() ?? json['message']?.toString() ?? 'Something went wrong',
      body: json['data'] ?? json,
      statusCode: statusCode,
      errors: json['errors'] as List<dynamic>?,
    );
  }
}
