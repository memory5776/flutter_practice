class APIResponse<T> {
  final int? statusCode;
  final T? value;

  APIResponse({this.statusCode, this.value});
}