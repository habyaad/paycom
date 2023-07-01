import 'package:dio/dio.dart';
import 'package:paycom/model/api_response_model.dart';
import 'package:paycom/services/logger_service.dart';

class ApiServices {
  static final Dio dio = Dio();
  final LoggerService _logger = LoggerService();

  Future<ApiResponse> post(
      String endPoint, Map<String, dynamic> userData) async {
    try {
      Response response = await dio.post(endPoint, data: userData);
      // Handle the response
      _logger.message(response.data.toString());

      if (response.statusCode! < 300) {
        return ApiResponse(success: true, data: response);
      } else {
        return ApiResponse(success: false, data: response);
      }
    } on DioException catch (error) {
      // Handle the error
      _logger.error('Error: $error');
      return ApiResponse(success: false);
    }
  }
}
