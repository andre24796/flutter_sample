import 'package:dio/dio.dart';

import 'api_response.dart';
import 'api_service.dart';

abstract class HttpRequest {
  //TODO: default values - override(modify via constructor) or leave for new request
  String body = '';
  Map<String, dynamic> params = Map();
  String path = '/';
  String baseUrl = "https://your_url.com";
  int timeout = 15000;
  Options options = Options(method: HttpMethod.GET.rawValue);
  Map<String, dynamic> headers = Map();

  Future<ApiResponse> sendRequest() {
    return ApiService.getInstance()
        .request(
            path: path,
            baseUrl: baseUrl,
            timeout: timeout,
            options: options.merge(headers: headers),
            requestBody: body,
            queryParams: params)
        .then((result) =>
            result.isSuccess ? deserializeResponseData(result) : result);
  }

  //TODO: default functions - override or leave for new request

  ApiResponse deserializeResponseData(ApiResponse response) {
    return response;
  }
}

enum HttpMethod { GET, POST, PUT, DELETE }

extension HttpMethodExtension on HttpMethod {
  String get rawValue => toString().split('.').last;
}
