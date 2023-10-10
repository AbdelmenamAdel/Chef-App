import 'package:chef/feature/menu/presentation/screens/menu_screen.dart';
import 'package:chef/feature/profile/presentation/screens/profile_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int currentIndex = 0;
  List<Widget> screens = [
    const MenuScreen(),
    const ProfileHomeScreen(),
  ];

  //! changeIndex of nav bar in home screen
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }
}
