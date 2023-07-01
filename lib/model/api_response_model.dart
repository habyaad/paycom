
class ApiResponse {
  final bool success;
  dynamic data;

  ApiResponse({
    required this.success,
    this.data,
  });
}