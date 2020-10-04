class ApiResponse {
  dynamic _response;
  int _statusCode;
  bool _isSuccess;

  ApiResponse(dynamic response, int statusCode, bool isSuccess) {
    _response = response;
    _statusCode = statusCode;
    _isSuccess = isSuccess;
  }

  dynamic get getResponse => _response;
  int get getStatusCode => _statusCode;
  bool get isSuccess => _isSuccess;
}
