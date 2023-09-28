import 'package:chef/core/common/navigate.dart';
import 'package:chef/core/database/cache/cache_helper.dart';
import 'package:chef/core/database/remote/end_point.dart';
import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/routes/app_routs.dart';
import 'package:chef/core/utils/app_colors.dart';
import 'package:chef/core/utils/app_images.dart';
import 'package:chef/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/custom_Image.dart';
import '../cubits/chef/chef_cubit.dart';
import '../cubits/chef/chef_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
    ).then(
      (value) async {
        await sl<CacheHelper>().getData(key: Apikeys.token) == null
            ? context.toView(Routes.chageLang)
            : context.toView(Routes.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: BlocBuilder<ChefCubit, ChefState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomImage(
                  image: AppImages.logoo,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  AppStrings.appName.tr(context),
                  style: Theme.of(context).textTheme.displayLarge,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
