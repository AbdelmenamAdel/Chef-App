import 'package:chef/core/common/navigate.dart';
import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/utils/app_strings.dart';
import 'package:chef/core/widgets/customButton.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/app_routs.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_awsome_dialoge.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CustomButton(
                onPressed: () {
                  context.navigate(Routes.addMeal);
                },
                text: AppStrings.addmeal.tr(context),
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 60,
                          width: 60,
                          child: CustomCachedNetworkImage(
                            fit: BoxFit.cover,
                            imgUrl:
                                'https://www.celebritycruises.com/blog/content/uploads/2021/09/provencal-food-ratatouille-1600x890.jpg',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('title'),
                            Text('subtitle'),
                            Text('price')
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              CustomAwsomeDialoge(
                                context,
                                message: AppStrings.dltMeal.tr(context),
                                okAction: () {},
                              ).show();
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: AppColors.red,
                              size: 16,
                            ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
