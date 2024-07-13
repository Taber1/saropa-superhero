import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:saropa_task/ui/common/ui_helpers.dart';

class ApiService {
  final String baseUrl =
      'https://superheroapi.com/api/b9fdc10c164018593bc28ad6abba47a7';

  final Dio _dio = Dio();

  ApiService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log("${options.uri} ${options.queryParameters} Data: ${options.data}");
          // Add common headers here
          options.headers['Content-Type'] = 'application/json';
          options.headers['x-api-x'] = '4';

          // Show loader while making the API request
          if (options.extra['showLoader'] == true) {
            log("onRequest: ${options.extra['showLoader']}");
            showCustomLoader();
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Hide loader after API response only if showLoader is true
          log("onResponse Loader: ${response.requestOptions.extra['showLoader']}");

          if (response.requestOptions.extra['showLoader'] == true) {
            hideCustomLoader();
          }

          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // Hide loader on error
          hideCustomLoader();

          // Handle error here, e.g., show toast message
          if (e.response != null) {
            log(e.response.toString());
            final Map<String, dynamic> responseJson =
                json.decode(e.response!.toString());
            log(responseJson.toString());
            showToast(msg: responseJson['message']);
          } else {
            showToast(msg: 'Network Error');
          }

          return handler.next(e);
        },
      ),
    );
  }

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool showLoader = false,
  }) async {
    try {
      final response = await _dio.get(
        '$baseUrl/$endpoint',
        queryParameters: queryParameters,
        options: Options(extra: {'showLoader': showLoader}),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? body,
    bool showLoader = false,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/$endpoint',
        data: jsonEncode(body),
        options: Options(extra: {'showLoader': showLoader}),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to post data');
    }
  }

  Future<dynamic> put(
    String endpoint, {
    required Map<String, dynamic> body,
    bool showLoader = false,
  }) async {
    try {
      final response = await _dio.put(
        '$baseUrl/$endpoint',
        data: jsonEncode(body),
        options: Options(extra: {'showLoader': showLoader}),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to post data');
    }
  }

  Future<dynamic> delete(
    String endpoint, {
    bool showLoader = false,
  }) async {
    try {
      final response = await _dio.delete(
        '$baseUrl/$endpoint',
        options: Options(extra: {'showLoader': showLoader}),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to delete data');
    }
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
