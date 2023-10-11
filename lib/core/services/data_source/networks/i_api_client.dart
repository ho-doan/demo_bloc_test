import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../data/models/entries.dart';

part 'i_api_client.g.dart';

@RestApi(baseUrl: 'https://api.publicapis.org/')
abstract class IApiClient {
  factory IApiClient.create(
    Dio dio, {
    String? baseUrl,
  }) =>
      ApiClient(dio, baseUrl: baseUrl);

  @GET('/entries')
  Future<EntriesModel> entries();
}
