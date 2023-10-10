import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../data/models/entries.dart';

part 'i_api_client.g.dart';

class ApiUtil {
  static Dio initDio({String? apiEndpoint}) {
    final dio = Dio();
    if (apiEndpoint != null) {
      dio.options.baseUrl = apiEndpoint;
    }
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.headers['Content-Type'] = 'application/json';

    dio.options.headers['Accept'] = 'text/json';

    return dio;
  }

  static ApiClient getApiClient() {
    final apiClient = ApiClient(initDio());
    return apiClient;
  }
}

@RestApi(baseUrl: 'https://api.publicapis.org/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET('/entries')
  Future<EntriesModel> entries();
}
