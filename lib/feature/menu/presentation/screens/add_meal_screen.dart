import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/utils/app_colors.dart';
import 'package:chef/core/utils/app_images.dart';
import 'package:chef/core/widgets/customTextField.dart';
import 'package:chef/core/widgets/custom_Image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/common/pick_image.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/customButton.dart';
import '../components/image_picker.dart';
import '../cubit/menu_cubit.dart';
import '../cubit/menu_state.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.addmeal.tr(context)),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocConsumer<MenuCubit, MenuState>(
              listener: (context, state) {},
              builder: (context, state) {
                final MenuCubit menuCubit = BlocProvider.of<MenuCubit>(context);
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: menuCubit.addMenuKey,
                    child: Column(
                      children: [
                        //! Image
                        Stack(
                          children: [
                            const CustomImage(image: AppImages.dfImage),
                            Positioned.directional(
                              textDirection: Directionality.of(context),
                              bottom: -5,
                              end: -5,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(18),
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(18),
                                    bottomLeft: Radius.zero,
                                  ),
                                  color: AppColors.primary,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return ImagePickerComponent(
                                          cameraOnTap: () async {
                                            pickImage(ImageSource.camera)
                                                .then((value) => null);
                                            Navigator.pop(context);
                                          },
                                          galleryOnTap: () {
                                            pickImage(ImageSource.gallery)
                                                .then((value) => null);
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        //! Name of meal
                        CustomTextField(
                          hintText: AppStrings.name.tr(context),
                          controller: menuCubit.menuNameController,
                          validator: (data) {
                            if (data!.isEmpty) {
                              return AppStrings.musntBMt.tr(context);
                            }
                            return null;
                          },
                          onSave: (data) => menuCubit.menuNameController.text,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        //! price of meal
                        CustomTextField(
                          hintText: AppStrings.price.tr(context),
                          controller: menuCubit.menuPriceController,
                          type: TextInputType.number,
                          validator: (data) {
                            if (data!.isEmpty) {
                              return AppStrings.musntBMt.tr(context);
                            }
                            if (num.tryParse(data) == null) {
                              return AppStrings.validcode.tr(context);
                            }

                            return null;
                          },
                          onSave: (data) => menuCubit.menuPriceController.text,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        //! Drop down field
                        DropdownButtonFormField(
                          isExpanded: true,
                          value: menuCubit.selectedItem,
                          hint: const Text('handle it dnt fotget'),
                          items: menuCubit.categoryList
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (item) {
                            menuCubit.changeItem(item);
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        //! description of meal
                        CustomTextField(
                          hintText: AppStrings.description.tr(context),
                          controller: menuCubit.menuDescController,
                          validator: (data) {
                            if (data!.isEmpty) {
                              return AppStrings.musntBMt.tr(context);
                            }
                            return null;
                          },
                          onSave: (data) => menuCubit.menuDescController.text,
                        ),
                        SizedBox(
                          height: 16.h,
                        ), //! Quantity
                        Row(
                          children: [
                            Row(
                              children: [
                                Radio(
                                  activeColor: AppColors.primary,
                                  groupValue: menuCubit.groupValue,
                                  value: 'quantity',
                                  onChanged: (value) {
                                    menuCubit.changeGroupValue(value);
                                  },
                                ),
                                Text(
                                  'quantity'.tr(context),
                                )
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Radio(
                                  activeColor: AppColors.primary,
                                  groupValue: menuCubit.groupValue,
                                  value: 'number',
                                  onChanged: (value) {
                                    menuCubit.changeGroupValue(value);
                                  },
                                ),
                              ],
                            ),
                            Text('number'.tr(context)),
                          ],
                        ),

                        //! Add To Menu button
                        // state is LoginLoadingState
                        //     ? const CustomLoadingIndicator()
                        //     :
                        CustomButton(
                          onPressed: () async {
                            if ((menuCubit.addMenuKey.currentState!
                                .validate())) {
                            } else {
                              return;
                            }
                          },
                          text: AppStrings.addToMenu.tr(context),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
