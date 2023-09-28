import 'package:chef/feature/auth/presentation/cubits/send_code/send_code_cubit.dart';
import 'package:chef/feature/home/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/bloc/bloc_observer.dart';
import 'core/bloc/cubit/global_cubit.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/services/service_locator.dart';
import 'feature/auth/presentation/cubits/chef/chef_cubit.dart';
import 'feature/auth/presentation/cubits/login/login_cubit.dart';

//!!!!!!!!!!!!! login and signUp using the same cubit,models and repo files !!!!!!!!!!!!!
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await initServiceLocator();
  await sl<CacheHelper>().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ChefCubit>(
          create: (context) => sl<ChefCubit>()..getChefData(),
        ),
        BlocProvider<GlobalCubit>(
          create: (context) => sl<GlobalCubit>()..updateLangage(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => sl<LoginCubit>(),
        ),
        BlocProvider<SendCodeCubit>(
          create: (context) => sl<SendCodeCubit>(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => sl<HomeCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
