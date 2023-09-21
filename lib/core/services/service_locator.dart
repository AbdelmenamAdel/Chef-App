import 'package:chef/core/bloc/cubit/global_cubit.dart';
import 'package:chef/core/database/remote/api_consumer.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../database/cache/cache_helper.dart';
import '../database/remote/dio_consumer.dart';

final sl = GetIt.instance;
Future<void> initServiceLocator() async {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
  sl.registerLazySingleton<GlobalCubit>(() => GlobalCubit());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsymer(sl()));
}
