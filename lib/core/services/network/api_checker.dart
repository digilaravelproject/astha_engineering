import 'package:dio/dio.dart';
import 'package:astha_engineering/core/services/network/response_model.dart';
import 'package:astha_engineering/core/utils/logger.dart';

class ApiChecker {
  static ResponseModel checkApi(Response response) {
    final statusCode = response.statusCode ?? 500;

    if (statusCode == 401) {
      final errorMessage = response.data is Map ? (response.data['msg'] ?? response.data['message'] ?? 'Session expired.') : 'Session expired.';
      AppLogger.error('Unauthorized access: $errorMessage');
      // TODO: Dispatch global Logout event via BLoC or use Router for redirection
      return ResponseModel(
        isSuccess: false,
        message: errorMessage.toString(),
        statusCode: 401,
      );
    }

    if (statusCode == 200 || statusCode == 201) {
      if (response.data is Map<String, dynamic>) {
        try {
          return ResponseModel.fromJson(response.data as Map<String, dynamic>, statusCode: statusCode);
        } catch (e) {
          AppLogger.error('API Check JSON parse error: $e');
          return ResponseModel(
            isSuccess: false,
            message: 'Invalid response format',
            statusCode: statusCode,
          );
        }
      }
      return ResponseModel(
        isSuccess: true,
        message: 'Success',
        statusCode: statusCode,
        body: response.data,
      );
    }

    // Default error handling for non-200/201 status codes
    String errorMsg = 'Something went wrong';
    if (response.data is Map<String, dynamic>) {
      errorMsg = response.data['msg'] ?? response.data['message'] ?? errorMsg;
    }
    
    AppLogger.warning('API Error: $statusCode - $errorMsg');
    return ResponseModel(
      isSuccess: false,
      message: errorMsg,
      statusCode: statusCode,
      body: response.data,
    );
  }

  static ResponseModel handleError(dynamic error) {
    String message = 'Something went wrong';
    int statusCode = 500;

    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          message = 'Connection timed out';
          statusCode = 408;
          break;
        case DioExceptionType.badResponse:
          if (error.response != null) {
            return checkApi(error.response!);
          }
          message = 'Bad response from server';
          break;
        case DioExceptionType.cancel:
          message = 'Request cancelled';
          break;
        case DioExceptionType.connectionError:
          message = 'No internet connection';
          statusCode = 503;
          break;
        default:
          message = 'Unknown network error';
          break;
      }
      AppLogger.error('DioError: ${error.message}');
    } else {
      AppLogger.error('Unknown Error: $error');
    }

    return ResponseModel(
      isSuccess: false,
      message: message,
      statusCode: statusCode,
    );
  }
}
