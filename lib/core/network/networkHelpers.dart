import 'package:dio/dio.dart';
import 'package:weather_app/core/network/endPoints.dart';

class NetworkHelper {
  late final Dio _dio;

  NetworkHelper._() {
    _dio = _configureDio();
  }

  static final NetworkHelper instance = NetworkHelper._();

  factory NetworkHelper() => instance;

  static Dio _configureDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
      ),
    );

    return dio;
  }

  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? params,
  }) async {
    var response = await _dio.get(endPoint, queryParameters: params);
    return response;
  }
}
