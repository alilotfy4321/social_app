import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_app/shared_in_app/constants.dart';
import 'package:social_app/view/social_layout/chats/chats.dart';
import 'package:social_app/view/social_layout/home/home.dart';
import 'package:social_app/view/social_layout/settings/settings.dart';
import 'package:social_app/view/social_layout/users/users.dart';

part 'social_app_states.dart';

class SocialAppCubit extends Cubit<SocialAppStates> {
  SocialAppCubit() : super(SocialAppInitial());

  static SocialAppCubit get(context) => BlocProvider.of(context);

//---------------------------------navBar
  int currentIndex = 0;
  List<String> screenTitles = [
    'Home',
    'Chats',
    'Users',
    'Settings',
  ];
  List<Widget> screens = [
    HomeScreen(),
    ChatsScreen(),
    UsersScreen(),
    SettingsScreen()
  ];

  changeBottomNavBarIndex(int index) {
    currentIndex = index;
    emit(SocialAppChangeNavBarState());
  }

//---------------------------------change mode
  changeMode() {
    isDark = !isDark;
    emit(SocialAppChangeModeState());
  }


}
