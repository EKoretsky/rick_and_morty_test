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

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://rickandmortyapi.com/api',
        connectTimeout: const Duration(seconds: 5),
        contentType: Headers.jsonContentType,
      ),
    );

    dio.interceptors.add(
      LogInterceptor(request: false, requestBody: false, requestHeader: false, responseHeader: false),
    );
    return dio;
  }
}
