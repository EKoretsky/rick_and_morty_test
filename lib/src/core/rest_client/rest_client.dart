import 'package:dio/dio.dart';

class RestClient {
  RestClient._() {
    _dio = RestClient._createDio();
  }

  factory RestClient() => _instance ??= RestClient._();

  static RestClient? _instance;

  late final Dio _dio;

  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return await _dio.get<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: options,
      onReceiveProgress: onReceiveProgress,
    );
  }

  // Future<void> post(
  //   String path, {
  //   Object? data,
  //   Map<String, dynamic>? queryParameters,
  //   Options? options,
  //   CancelToken? cancelToken,
  //   void Function(int, int)? onSendProgress,
  //   void Function(int, int)? onReceiveProgress,
  // }) async {
  //   _client.post(
  //     path,
  //     data: data,
  //     options: options,
  //     queryParameters: queryParameters,
  //     onReceiveProgress: onSendProgress,
  //     cancelToken: cancelToken,
  //     onSendProgress: onSendProgress,
  //   );
  // }
  //
  // Future<void> delete(
  //   String path, {
  //   Object? data,
  //   Map<String, dynamic>? queryParameters,
  //   Options? options,
  //   CancelToken? cancelToken,
  // }) async {
  //   _client.delete(path, data: data, options: options, cancelToken: cancelToken, queryParameters: queryParameters);
  // }

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://rickandmortyapi.com/api',
        connectTimeout: const Duration(seconds: 5),
        contentType: Headers.jsonContentType,
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: false,
        requestBody: false,
        requestHeader: false,
        responseHeader: false,
      ),
    );
    return dio;
  }
}
