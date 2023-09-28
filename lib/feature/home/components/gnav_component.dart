import 'package:chef/core/locale/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../home_cubit/home_cubit.dart';

class GNavComponent extends StatelessWidget {
  const GNavComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: GNav(
          activeColor: AppColors.primary,
          selectedIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
          tabBackgroundColor: AppColors.grayAcc,
          padding: const EdgeInsets.all(16),
          tabBorderRadius: 16,
          gap: 8,
          onTabChange: (index) {
            BlocProvider.of<HomeCubit>(context).changeIndex(index);
          },
          tabs: [
            GButton(
              icon: Icons.person,
              text: AppStrings.person.tr(context),
            ),
            GButton(
              icon: Icons.menu,
              text: AppStrings.menu.tr(context),
            ),
          ]),
    );
  }
}
