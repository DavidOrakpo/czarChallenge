import 'package:dio/dio.dart';
import 'package:template/api/utils/network_response.dart';

/// A Base Class representing the required methods that any Service class should implement
abstract class NetworkApi {
  /// Handles GET requests made by the service class, taking the required url [url] and any
  /// possible query Parameters [queryParameters]
  Future<NetworkResponse> get({
    required String url,
    String? token,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
  });

  Future<NetworkResponse> post({
    required Map<String, dynamic> payload,
    required String url,
    CancelToken? cancelToken,
    String? token,
    Map<String, dynamic>? queryParameters,
  });

  Future<NetworkResponse> delete({
    required String url,
    CancelToken? cancelToken,
    String? token,
    Map<String, dynamic>? queryParameters,
  });

  Future<NetworkResponse> put({
    required Map<String, dynamic> payload,
    required String url,
    CancelToken? cancelToken,
    String? token,
    Map<String, dynamic>? queryParameters,
  });

  Future<NetworkResponse> patch({
    required Map<String, dynamic> payload,
    required String url,
    String? token,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
  });

  Future<NetworkResponse> postFormData({
    required Map<String, String> fields,
    required Map<String, MultipartFile> multiPaths,
    List<String>? paths,
    required String url,
    CancelToken? cancelToken,
    String? token,
    Map<String, dynamic>? queryParameters,
  });

  Future<NetworkResponse> uploadSingleImage({
    required String path,
    required String url,
    String? token,
    Map<String, dynamic>? queryParameters,
  });
}
