import 'package:chef/core/bloc/cubit/global_cubit.dart';
import 'package:chef/core/themes/app_theme.dart';
import 'package:chef/feature/auth/presentation/cubits/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/bloc/cubit/global_state.dart';
import '../core/locale/app_locale.dart';
import '../core/routes/app_routs.dart';
import '../core/services/service_locator.dart';
import '../feature/auth/presentation/cubits/chef/chef_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChefCubit>(
          create: (context) => ChefCubit()..getChefData(),
        ),
        BlocProvider<GlobalCubit>(
          create: (context) => sl<GlobalCubit>()..updateLangage(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => BlocBuilder<GlobalCubit, GlobalState>(
          builder: (context, state) {
            return MaterialApp(
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', "US"),
                Locale('ar', "EG"),
              ],
              locale: Locale(BlocProvider.of<GlobalCubit>(context).langCode),
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.initialRoute,
              onGenerateRoute: AppRoutes.generatedRoute,
              theme: getAppTheme(),
            );
          },
        ),
      ),
    );
  }
}
