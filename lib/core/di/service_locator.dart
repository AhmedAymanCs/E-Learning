import 'package:dio/dio.dart';
import 'package:e_learning/core/networking/api_constant.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDioLocator() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveTimeout: const Duration(milliseconds: ApiConstant.timeOut),
        connectTimeout: const Duration(milliseconds: ApiConstant.timeOut),
        queryParameters: ApiConstant.queryParameters,
        headers: ApiConstant.headers,
      ),
    ),
  );
}
