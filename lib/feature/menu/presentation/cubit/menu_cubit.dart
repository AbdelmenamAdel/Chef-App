import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());
  XFile? image;
  GlobalKey<FormState> addMenuKey = GlobalKey<FormState>();
  TextEditingController menuNameController = TextEditingController();
  TextEditingController menuPriceController = TextEditingController();
  TextEditingController menuDescController = TextEditingController();
  List categoryList = [
    'Beef',
    'Chicken',
    'Fish',
    'Seafood',
    'Pork',
    'Lamp',
    'vegetarian',
    'vegan',
    'Gluten-free',
  ];
  String selectedItem = 'Beef';
  // Future getImage() async {
  //   image = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   emit(MenuLoaded(image: image));
  // }
  String groupValue = 'quantity';
  void changeItem(item) {
    selectedItem = item;
    emit(ChangeItemState());
  }

  void changeGroupValue(value) {
    groupValue = value;
    emit(ChangeGroupState());
  }
}
