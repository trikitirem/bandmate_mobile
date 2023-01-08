class ApiException implements Exception {
  ApiException(this.cause);
  String cause;
}
