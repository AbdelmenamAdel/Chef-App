import 'package:chef/core/bloc/cubit/global_cubit.dart';
import 'package:chef/core/database/remote/api_consumer.dart';
import 'package:chef/feature/auth/data/repository/auth_repository.dart';
import 'package:chef/feature/auth/presentation/cubits/chef/chef_cubit.dart';
import 'package:chef/feature/auth/presentation/cubits/login/login_cubit.dart';
import 'package:chef/feature/auth/presentation/cubits/send_code/send_code_cubit.dart';
import 'package:chef/feature/home/home_cubit/home_cubit.dart';
import 'package:chef/feature/menu/data/repository/menu_repository.dart';
import 'package:chef/feature/menu/presentation/cubit/menu_cubit.dart';
import 'package:dio/dio.dart';
import '../database/cache/cache_helper.dart';
import '../database/remote/dio_consumer.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initServiceLocator() async {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
  sl.registerLazySingleton<ChefCubit>(() => ChefCubit());
  sl.registerLazySingleton<GlobalCubit>(() => GlobalCubit());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsymer(sl()));
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl()));
  sl.registerLazySingleton<SendCodeCubit>(() => SendCodeCubit(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository());
  sl.registerLazySingleton<HomeCubit>(() => HomeCubit());
  sl.registerLazySingleton<MenuCubit>(() => MenuCubit(sl()));
  sl.registerLazySingleton<MenuRepository>(() => MenuRepository());
}
