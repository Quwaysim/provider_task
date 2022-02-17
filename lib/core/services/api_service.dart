import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:provider_task/utils/api_handlers/api_handler.dart';
import 'package:provider_task/utils/api_handlers/dio_interceptors.dart';
import 'package:provider_task/utils/constants.dart';

class ApiService implements Api {
  final log = Logger();
  final dio = Dio();
  final String apiUrl = 'https://geniopay.net/api/v1.0';

  ApiService() {
    dio.interceptors.add(DioInterceptor());
    dio.options.sendTimeout = 60000;
    dio.options.receiveTimeout = 60000;
    dio.options.baseUrl = apiUrl;
    log.i('App Api constructed and DIO setup registered');
  }

  Future<dynamic> post({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    log.i('Making request to $apiUrl');
    try {
      final response = await dio.post(
        '$apiUrl/$endpoint',
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      log.i('Response from $apiUrl \n${response.data}');
      return response;
    } on DioError catch (e) {
      log.i('DIO Exception ${e.response!.data.toString()}');
      return e.response;
    } on SocketException {
      return 'check your internet connection';
    }
  }

  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? body,
    required Map<String, dynamic>? headers,
  }) async {
    log.i('Making request to $apiUrl');
    try {
      final response = await dio.get(
        '$apiUrl/$endpoint',
        options: Options(
          headers: headers,
        ),
      );
      log.i('Response from $apiUrl \n${response.data}');
      return response;
    } on DioError catch (e) {
      log.i('DIO Exception ${e.response!.data.toString()}');
      return e.response;
    } on SocketException {
      return 'check your internet connection';
    }
  }

  Future<dynamic> put({
    required String endpoint,
    Map<String, dynamic>? body,
    required Map<String, dynamic>? headers,
  }) async {
    log.i('Making request to $apiUrl');
    try {
      final response = await dio.put(
        '$apiUrl/$endpoint',
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      log.i('Response from $apiUrl \n${response.data}');
      return response;
    } on DioError catch (e) {
      log.i('DIO Exception ${e.response!.data.toString()}');
      return e.response;
    } on SocketException {
      return 'check your internet connection';
    }
  }

  @override
  Future register({required String? email}) async {
    return await post(endpoint: registrationEndpoint, body: {'email': email});
  }

  @override
  Future getApiToken({required String? email, required String token}) async {
    return await post(endpoint: getTokenEndpoint, body: {
      'email': email,
      'token': token,
    });
  }

  @override
  Future getUserProfile({required String token}) async {
    final headers = {
      'Authorization': 'Token $token',
    };
    return await get(endpoint: userProfileEndpoint, headers: headers);
  }

  @override
  Future updateUserProfile({
    required String firstName,
    required String lastName,
    required String country,
    required String token,
  }) async {
    final headers = {
      'Authorization': 'Token $token',
    };
    return await put(
      endpoint: updateUserProfileEndpoint,
      body: {
        'first_name': firstName,
        'last_name': lastName,
        'country': country
      },
      headers: headers,
    );
  }
}
