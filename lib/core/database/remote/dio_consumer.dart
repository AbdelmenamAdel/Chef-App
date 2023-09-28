import 'package:chef/core/database/remote/api_interceptors.dart';
import 'package:chef/core/database/remote/end_point.dart';
import 'package:chef/core/errors/error_model.dart';
import 'package:chef/core/errors/exception.dart';
import 'package:dio/dio.dart';

import 'api_consumer.dart';

class DioConsymer extends ApiConsumer {
  final Dio dio;
  DioConsymer(
    this.dio,
  ) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }
  //!Delete
  @override
  Future<dynamic> delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  //!Get
  @override
  Future<dynamic> get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  //!Patch
  @override
  Future<dynamic> patch(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  //!Post
  @override
  Future<dynamic> post(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  //!Switch void
  handleDioExeption(e) {
    switch (e.type) {
      case DioExceptionType.badCertificate:
        throw BadCertificateException(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.connectionTimeout:
        throw ConnectionTimeoutException(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.receiveTimeout:
        throw ReceiveTimeoutException(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.sendTimeout:
        throw SendTimeoutException(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.connectionError:
        throw ConnectionErrorException(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400:
            throw BadRequestException(
                ErrorModel.fromJson(e.response!.data)); //* bad request
          case 401:
            throw UnauthorizedException(
                ErrorModel.fromJson(e.response!.data)); //* unauthorized
          case 403:
            throw ForbiddenException(
                ErrorModel.fromJson(e.response!.data)); //* forbidden
          case 404:
            throw NotFoundException(
                ErrorModel.fromJson(e.response!.data)); //* not found
          case 409:
            throw ConflictException(
                ErrorModel.fromJson(e.response!.data)); //* conflict
          default:
            throw ServerException(ErrorModel.fromJson(e.response!.data));
        }
      case DioExceptionType.cancel:
        throw CancelException(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.unknown:
        throw UnKnownException(ErrorModel.fromJson(e.response!.data));
    }
  }
}
