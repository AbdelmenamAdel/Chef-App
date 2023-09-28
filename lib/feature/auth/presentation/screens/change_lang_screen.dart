import 'package:chef/core/common/navigate.dart';
import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/utils/app_colors.dart';
import 'package:chef/core/utils/app_images.dart';
import 'package:chef/core/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/cubit/global_cubit.dart';
import '../../../../core/bloc/cubit/global_state.dart';
import '../../../../core/routes/app_routs.dart';
import '../../../../core/widgets/custom_Image.dart';

class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const CustomImage(
            image: AppImages.background,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomImage(
                  image: AppImages.logoo,
                  boxFit: BoxFit.none,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'chLangTitle'.tr(context),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(
                  height: 54.h,
                ),
                Text(
                  'chLangSubTitle'.tr(context),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 120.h,
                ),
                BlocBuilder<GlobalCubit, GlobalState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        CustomButton(
                          onPressed: () {
                            BlocProvider.of<GlobalCubit>(context).getLang('ar');
                            context.toView(Routes.login);
                          },
                          text: 'arabic'.tr(context),
                          backgroundColor: AppColors.black,
                        ),
                        const Spacer(),
                        CustomButton(
                          onPressed: () {
                            BlocProvider.of<GlobalCubit>(context).getLang('en');
                            context.toView(Routes.login);
                          },
                          text: 'english'.tr(context),
                          backgroundColor: AppColors.black,
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
