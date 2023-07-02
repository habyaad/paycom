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

        return ApiResponse(success: true, data: response);

    } on DioException catch (error) {
      // Handle the error
      _logger.error('Error: ${error.response} ');
      return ApiResponse(success: false, data: error);

    }
  }
}
