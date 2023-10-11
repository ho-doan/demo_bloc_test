import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../data_source/networks/i_api_client.dart';
import 'service_locator.config.dart';

final getIt = GetIt.instance;

// ignore: inference_failure_on_function_return_type
@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
// ignore: always_declare_return_types
configureDependencies() {
  final dio = Dio();
  // if (apiEndpoint != null) {
  //   dio.options.baseUrl = apiEndpoint!;
  // }
  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.options.headers['Content-Type'] = 'application/json';

  dio.options.headers['Accept'] = 'text/json';

  getIt.registerLazySingleton<IApiClient>(
    () => IApiClient.create(dio), //, baseUrl: apiEndpoint
  );
  $initGetIt(getIt);
}

@visibleForTesting
configureDependenciesTest() {
  getIt.registerLazySingleton<IApiClient>(() => IApiClient.create(Dio()));
  $initGetIt(getIt);
}
