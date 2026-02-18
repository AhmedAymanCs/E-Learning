import 'package:dio/dio.dart';
import 'package:e_learning/core/networking/api_constant.dart';
import 'package:e_learning/core/networking/dio_helper.dart';
import 'package:e_learning/feature/quiz/data/repository/questions_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDioLocator() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveTimeout: const Duration(seconds: ApiConstant.receiveTimeout),
        connectTimeout: const Duration(seconds: ApiConstant.connectTimeout),
        headers: ApiConstant.headers,
      ),
    ),
  );
  getIt.registerLazySingleton<DioHelper>(() => DioHelper(getIt<Dio>()));
  getIt.registerLazySingleton<QuestionsRepository>(
    () => QuestionsRepository(getIt<DioHelper>()),
  );
}
