import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:template/api/interfaces/network_call_interface.dart';
import 'package:template/api/utils/network_response.dart';

import '../utils/logger.dart';

final cancelTokenStateProvider =
    StateProvider<CancelToken>((ref) => CancelToken());

/// This class handles direct communication with the API to retrieve data needed by the app
///
/// It performs a GET request using [get], encapsulates the response in [_handleResponse], and handles errors in the
/// [addInterceptors] method
class DioService extends NetworkApi {
  DioService._initialize();

  static final DioService _instance = DioService._initialize();
  factory DioService() => _instance;

  /// Performs get requests, taking in a url [url], and any needed query parameters [queryParameters]
  @override
  Future<NetworkResponse> get({
    required String url,
    String? token,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
  }) async {
    var result = NetworkResponse.warning();
    final dioClient = Dio(
      BaseOptions(
        headers: _getHeaders(token),
        queryParameters: queryParameters,
        connectTimeout: const Duration(seconds: 40),
      ),
    )..interceptors.add(addInterceptors());
    dioClient.interceptors.add(
      RetryInterceptor(
        dio: dioClient,
        logPrint: logger.i,
      ),
    );
    try {
      final response = await dioClient.get(url, cancelToken: cancelToken);
      result = _handleResponse(response);
    } on DioError catch (e) {
      result = _handleError(e, result);
    } finally {
      dioClient.close();
    }
    return result;
  }

  @override
  Future<NetworkResponse> post(
      {required Map<String, dynamic> payload,
      required String url,
      String? token,
      CancelToken? cancelToken,
      Map<String, dynamic>? queryParameters}) async {
    var result = NetworkResponse.warning();
    final dioClient = Dio(
      BaseOptions(
        headers: _getHeaders(token),
        queryParameters: queryParameters,
        connectTimeout: const Duration(seconds: 40),
      ),
    )..interceptors.add(addInterceptors());
    dioClient.interceptors.add(
      RetryInterceptor(
        dio: dioClient,
        logPrint: logger.i,
      ),
    );
    try {
      final response = await dioClient.post(
        url,
        cancelToken: cancelToken,
        data: json.encode(payload),
      );
      result = _handleResponse(response);
    } on DioError catch (e) {
      result = _handleError(e, result);
    } finally {
      dioClient.close();
    }
    return result;
  }

  @override
  Future<NetworkResponse> delete(
      {required String url,
      String? token,
      CancelToken? cancelToken,
      Map<String, dynamic>? queryParameters}) async {
    var result = NetworkResponse.warning();
    final dioClient = Dio(
      BaseOptions(
        headers: _getHeaders(token),
        queryParameters: queryParameters,
        connectTimeout: const Duration(seconds: 40),
      ),
    )..interceptors.add(addInterceptors());
    dioClient.interceptors.add(
      RetryInterceptor(
        dio: dioClient,
        logPrint: logger.i,
      ),
    );
    try {
      final response = await dioClient.delete(url, cancelToken: cancelToken);
      result = _handleResponse(response);
    } on DioError catch (e) {
      result = _handleError(e, result);
    } finally {
      dioClient.close();
    }
    return result;
  }

  @override
  Future<NetworkResponse> patch(
      {required Map<String, dynamic> payload,
      required String url,
      CancelToken? cancelToken,
      String? token,
      Map<String, dynamic>? queryParameters}) async {
    var result = NetworkResponse.warning();
    final dioClient = Dio(
      BaseOptions(
        headers: _getHeaders(token),
        queryParameters: queryParameters,
        connectTimeout: const Duration(seconds: 40),
      ),
    )..interceptors.add(addInterceptors());
    try {
      final response = await dioClient.patch(url,
          data: json.encode(payload), cancelToken: cancelToken);
      result = _handleResponse(response);
    } on DioError catch (e) {
      result = _handleError(e, result);
    } finally {
      dioClient.close();
    }
    return result;
  }

  @override
  Future<NetworkResponse> postFormData({
    required Map<String, String> fields,
    required Map<String, MultipartFile> multiPaths,
    List<String>? paths,
    CancelToken? cancelToken,
    required String url,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    var result = NetworkResponse.warning();
    final dioClient = Dio(
      BaseOptions(
        headers: _getHeaders(
          token,
        ),
        queryParameters: queryParameters,
        connectTimeout: const Duration(seconds: 40),
      ),
    )..interceptors.add(addInterceptors());
    try {
      final formData = FormData.fromMap({
        ...fields,
        ...multiPaths,
      });

      final dioResponse = await dioClient.post(
        url,
        data: formData,
        cancelToken: cancelToken,
        options: Options(responseType: ResponseType.bytes),
      );
      var bytesAsData = dioResponse.data;
      final dioData = _streamToJson(bytesAsData);
      result = NetworkResponse.success(
        message: 'Success',
        data: dioData,
      );
    } on DioError catch (e) {
      result = _handleError(e, result);
    } finally {
      dioClient.close();
    }
    return result;
  }

  @override
  Future<NetworkResponse> put(
      {required Map<String, dynamic> payload,
      required String url,
      String? token,
      CancelToken? cancelToken,
      Map<String, dynamic>? queryParameters}) async {
    var result = NetworkResponse.warning();
    final dioClient = Dio(
      BaseOptions(
        headers: _getHeaders(token),
        queryParameters: queryParameters,
        connectTimeout: const Duration(seconds: 40),
      ),
    )..interceptors.add(addInterceptors());
    dioClient.interceptors.add(
      RetryInterceptor(
        dio: dioClient,
        logPrint: logger.i,
      ),
    );
    try {
      final response = await dioClient.put(url,
          data: json.encode(payload), cancelToken: cancelToken);
      result = _handleResponse(response);
    } on DioError catch (e) {
      result = _handleError(e, result);
    } finally {
      dioClient.close();
    }
    return result;
  }

  @override
  Future<NetworkResponse> uploadSingleImage(
      {required String path,
      required String url,
      String? token,
      Map<String, dynamic>? queryParameters}) async {
    var result = NetworkResponse.warning();
    final dioClient = Dio(
      BaseOptions(
        headers: _getHeaders(token),
        queryParameters: queryParameters,
        connectTimeout: const Duration(seconds: 40),
      ),
    )..interceptors.add(addInterceptors());
    try {
      http.MultipartFile multiParts = await http.MultipartFile.fromPath(
          'image', path,
          filename: path.split('/').last);

      final request = http.MultipartRequest(
        "POST",
        Uri.parse(url),
      )
        ..files.add(multiParts)
        ..headers.addAll(_getHeaders(token));

      final response = await request.send();
      final data = _streamToJson(await response.stream.first);

      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        result = NetworkResponse.success(
          message: data is Map ? data['message'] : 'Success',
          data: data is Map ? data : null,
        );
      } else {
        result.message = data is Map ? data['message'] : 'An error occur';
      }
    } on DioError catch (e) {
      result = _handleError(e, result);
    } finally {
      dioClient.close();
    }
    return result;
  }

  dynamic _streamToJson(List<int> data) {
    try {
      return const JsonDecoder()
          .convert(const Utf8Decoder().convert(data).trim());
    } catch (error, trace) {
      log("-- _streamToJson error --");
      log(error.toString());
      log(trace.toString());
      log("*****");
    }
  }

  NetworkResponse _handleError(DioError e, NetworkResponse result) {
    if (e.type == DioErrorType.cancel) {
      log("Request Cancelled");
      return result
        ..message = "Request Cancelled"
        ..success = false
        ..data = e.response?.data;
    }
    switch (e.response?.statusCode) {
      case 400:
        log("From within dio service catch: ${(e.response?.data)["message"]}");
        result.message = (e.response?.data)["message"];
        return result;
      case 401:
        log("From within dio service catch: ${(e.response?.data)["message"]}");
        result.message = (e.response?.data)["message"];
        return result;
      case 500:
        log("From within dio service catch: ${(e.response?.data)["message"]}");
        result.message = "An error occured, please try again";
        return result;
      case 502:
        log("From within dio service catch: ${(e.response?.data)["message"]}");
        return result..message = "An error occured, please try again";
      default:
        return result..message = "An error occured, please try again";
    }
  }

  Map<String, String> _getHeaders(String? token) {
    var tempHeader = {
      Headers.acceptHeader: "application/json",
      Headers.contentTypeHeader: Headers.jsonContentType,
      if (token != null) "Authorization": "Token $token"
    };
    return tempHeader;
  }

  /// Wraps the response gotten from the API in the [NetworkResponse] class
  NetworkResponse _handleResponse(Response<dynamic> response) {
    NetworkResponse result = NetworkResponse.warning();
    final data = response.data;
    if (response.statusCode == 200 || response.statusCode == 201) {
      result = NetworkResponse.success(
        message: "success",
        data: data,
      );
    } else {
      result.code = response.statusCode!;
      result.message = data["message"] ?? "An error occured";
      result.data = data;
    }
    return result;
  }

  /// Watches for any errors that may result when the end points are called.
  InterceptorsWrapper addInterceptors() {
    var interceptor = InterceptorsWrapper(onError: (e, handler) async {
      switch (e.type) {
        case DioErrorType.receiveTimeout:
          log("The error is Receive Timeout. Message is ${e.message}");
          break;
        case DioErrorType.connectionTimeout:
          log("The error is connectTimeout. Message is ${e.message}");
          break;
        case DioErrorType.badResponse:
          break;
        case DioErrorType.cancel:
          log("The error is cancel. Message is ${e.message}");
          break;
        case DioErrorType.sendTimeout:
          log("The error is send. Message is ${e.message}");
          break;
        case DioErrorType.unknown:
          if (e.error is SocketException) {
            log("Socket Exception");
          }
          break;

        default:
      }

      return handler.next(e);
    }, onRequest: (request, handler) {
      return handler.next(request);
    }, onResponse: (response, handler) {
      return handler.next(response);
    });
    return interceptor;
  }
}
