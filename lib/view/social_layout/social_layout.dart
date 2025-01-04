import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/controller/social_app/social_app_cubit.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:social_app/shared_in_app/constants.dart';
import 'package:social_app/shared_in_app/sharedpref.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:  Text(cubit.screenTitles[cubit.currentIndex]),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  right: isArabic() ? 0 : 15.0,
                  left: isArabic() ? 15 : 0,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        cubit.changeMode();
                        CachHelper.saveUserCacheKey('isDark', isDark);
                      },
                      icon: Icon(
                        Icons.notifications_none_outlined,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        cubit.changeMode();
                        CachHelper.saveUserCacheKey('isDark', isDark);
                      },
                      icon: Icon(
                        Icons.search,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBarIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(AntDesign.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(AntDesign.wechat), label: 'chats'),
                BottomNavigationBarItem(
                    icon: Icon(AntDesign.user), label: 'Users'),
                BottomNavigationBarItem(
                    icon: Icon(AntDesign.setting), label: 'Settings'),
              ]),
        );
      },
    );
  }
}
