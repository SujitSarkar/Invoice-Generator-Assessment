part of 'remote_imports.dart';

class ApiClient {
  late BaseOptions baseOptions;
  late Dio dio;
  Options options = Options();

  ApiClient() {
    baseOptions = BaseOptions(baseUrl: ApiEndpointUrl.baseUrl);
    dio = Dio(baseOptions);
    options = Options(headers: {'Content-Type': 'application/json'});
  }

  Future<Response> getRequest(
      {required String path,
      Map<String, dynamic>? params,
      Map<String, dynamic>? header}) async {
    if (header != null) {
      options = Options(headers: header);
    }
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      throw ApiException(message: 'No internet connection');
    } else {
      try {
        final Response response =
            await dio.get(path, queryParameters: params, options: options);
        logResponse(response);
        return response;
      } on DioException catch (e) {
        if (e.response != null) {
          throw ApiException(
              message: e.response?.data['message'] ?? 'Invalid Data');
        } else {
          throw ApiException(message: e.message);
        }
      } catch (error) {
        throw ApiException(message: error.toString());
      }
    }
  }

  Future<Response> postRequest(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? params,
      Map<String, dynamic>? header}) async {
    if (header != null) {
      options = Options(headers: header);
    }
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      throw ApiException(message: 'No internet connection');
    } else {
      try {
        Response response = await dio.post(path,
            options: options, queryParameters: params, data: body);
        logResponse(response);
        return response;
      } on DioException catch (e) {
        if (e.response != null) {
          logResponse(e.response!);
          throw ApiException(
              message: e.response?.data['message'] ?? 'Invalid Data');
        } else {
          throw ApiException(message: e.message);
        }
      }
    }
  }

  void logResponse(Response response) {
    debugPrint('URL         : ${response.requestOptions.uri}');
    debugPrint('STATUS CODE : ${response.statusCode}');
    debugPrint('RESPONSE    : ${response.data}\n\n');
  }
}
