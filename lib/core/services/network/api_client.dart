import 'dart:io';
import 'package:dio/dio.dart';
import 'package:safecheck_techno/core/constants/app_urls.dart';
import 'package:safecheck_techno/core/services/network/api_checker.dart';
import 'package:safecheck_techno/core/services/network/network_info.dart';
import 'package:safecheck_techno/core/services/network/response_model.dart';
import 'package:safecheck_techno/core/services/storage/token_manger.dart';
import 'package:safecheck_techno/core/utils/logger.dart';

class ApiClient {
  final Dio _dio;
  final TokenManager tokenManager;
  final NetworkInfo networkInfo;

  // ignore: prefer_initializing_formals
  ApiClient({required Dio dio, required this.tokenManager, required this.networkInfo}) : _dio = dio {
    _dio.options.baseUrl = AppUrls.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = tokenManager.getToken();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        options.headers['Accept'] = 'application/json';
        return handler.next(options);
      },
    ));
  }

  Future<bool> _checkConnection() async {
    return await networkInfo.isConnected;
  }

  Future<ResponseModel> get(String uri, {Map<String, dynamic>? queryParameters, Options? options}) async {
    if (!await _checkConnection()) {
      return const ResponseModel(isSuccess: false, message: 'No internet connection', statusCode: 503);
    }
    try {
      AppLogger.debug('ApiClient -> GET: $uri');
      final response = await _dio.get(uri, queryParameters: queryParameters, options: options);
      return ApiChecker.checkApi(response);
    } catch (e) {
      return ApiChecker.handleError(e);
    }
  }

  Future<ResponseModel> post(String uri, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    if (!await _checkConnection()) {
      return const ResponseModel(isSuccess: false, message: 'No internet connection', statusCode: 503);
    }
    try {
      AppLogger.debug('ApiClient -> POST: $uri');
      final response = await _dio.post(uri, data: data, queryParameters: queryParameters, options: options);
      return ApiChecker.checkApi(response);
    } catch (e) {
      return ApiChecker.handleError(e);
    }
  }

  Future<ResponseModel> put(String uri, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    if (!await _checkConnection()) {
      return const ResponseModel(isSuccess: false, message: 'No internet connection', statusCode: 503);
    }
    try {
      AppLogger.debug('ApiClient -> PUT: $uri');
      final response = await _dio.put(uri, data: data, queryParameters: queryParameters, options: options);
      return ApiChecker.checkApi(response);
    } catch (e) {
      return ApiChecker.handleError(e);
    }
  }

  Future<ResponseModel> delete(String uri, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    if (!await _checkConnection()) {
      return const ResponseModel(isSuccess: false, message: 'No internet connection', statusCode: 503);
    }
    try {
      AppLogger.debug('ApiClient -> DELETE: $uri');
      final response = await _dio.delete(uri, data: data, queryParameters: queryParameters, options: options);
      return ApiChecker.checkApi(response);
    } catch (e) {
      return ApiChecker.handleError(e);
    }
  }

  Future<ResponseModel> postMultipartData(String uri, Map<String, String> body, List<MapEntry<String, File>> files, {Map<String, dynamic>? queryParameters}) async {
    if (!await _checkConnection()) {
      return const ResponseModel(isSuccess: false, message: 'No internet connection', statusCode: 503);
    }
    try {
      AppLogger.debug('ApiClient -> POST MULTIPART: $uri');
      FormData formData = FormData.fromMap(body);
      
      for (var fileEntry in files) {
        formData.files.add(MapEntry(
          fileEntry.key,
          await MultipartFile.fromFile(fileEntry.value.path, filename: fileEntry.value.path.split('/').last),
        ));
      }

      final response = await _dio.post(uri, data: formData, queryParameters: queryParameters);
      return ApiChecker.checkApi(response);
    } catch (e) {
      return ApiChecker.handleError(e);
    }
  }
}
