import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/utils/others.dart';

import 'api_response.dart';

class ApiService {
  static final ApiService _instance = ApiService();
  static ApiService getInstance() => _instance;
  Dio _dioClient;

  ApiService() {
    _dioClient = Dio();
  }

  Future<ApiResponse> request({
    @required String baseUrl,
    @required String path,
    @required int timeout,
    @required Options options,
    @required String requestBody,
    @required Map<String, dynamic> queryParams,
  }) async {
    String responseBody = '';
    int statusCode = 400;
    bool isSuccess = false;
    var message = '----REQUEST----';
    message += '\nbaseUrl: $baseUrl';
    message += '\npath: $path';
    message += '\nmethod: ${options.method}';
    message += '\nqueryParams: $queryParams';
    message += '\nheader: ${options.headers}';
    message += '\nbody: $requestBody';
    try {
      _dioClient.options = BaseOptions(baseUrl: baseUrl);
      final response = await _dioClient
          .request(path,
              data: requestBody, options: options, queryParameters: queryParams)
          .timeout(Duration(milliseconds: timeout));
      responseBody = (response.data is String)
          ? response.data
          : json.encode(response.data);
      statusCode = response.statusCode;
      isSuccess = true;
      message += '\n----RESPONSE----';
      message += '\nstatus: ${response.statusCode}';
      message += '\ndata: ${response.toString()}';
    } on TimeoutException catch (e) {
      responseBody = '';
      statusCode = 400;
      isSuccess = false;
      message += '\n----ERROR----';
      message += '\nTimeout Exception: ${e.message}';
    } on DioError catch (e) {
      responseBody = '';
      statusCode = 400;
      isSuccess = false;
      message += '\n----ERROR----';
      message += '\nDio Exception: ${e.message}';
    } catch (e) {
      responseBody = '';
      statusCode = 400;
      isSuccess = false;
      message += '\n----ERROR----';
      message += '\nUnexpected Exception: ${e.toString()}';
    }
    DevLog.getLogger().logInfo(message);
    return ApiResponse(responseBody, statusCode, isSuccess);
  }
}
