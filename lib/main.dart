// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, unused_local_variable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:social_app/controller/bloc_observer.dart';
import 'package:social_app/controller/login/login_cubit.dart';
import 'package:social_app/controller/reister/reister_cubit.dart';
import 'package:social_app/controller/social_app/social_app_cubit.dart';
import 'package:social_app/firebase_options.dart';
import 'package:social_app/generated/l10n.dart';
import 'package:social_app/shared_in_app/constants.dart';
import 'package:social_app/shared_in_app/sharedpref.dart';
import 'package:social_app/shared_in_app/themes.dart';
import 'package:social_app/view/authontication/login/login.dart';

import 'view/social_layout/social_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  Widget startWidget;
  await CachHelper.init();
  String? uid = await CachHelper.getUserCachedValue(key: 'uId');
  if (uid != null) {
    startWidget = SocialLayout();
  } else {
    startWidget = LoginScreen();
  }
  runApp(
    MyApp(
      startWidget: startWidget,
    ),
  );
}

class MyApp extends StatelessWidget {
  Widget startWidget;
  MyApp({
    super.key,
    required this.startWidget,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SocialReisterCubit>(
            create: (context) => SocialReisterCubit()),
        BlocProvider<SocialLoginCubit>(create: (context) => SocialLoginCubit()),
        BlocProvider<SocialAppCubit>(create: (context) => SocialAppCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale('en'),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: isDark?darkTheme:lightTheme,
        home: startWidget,
      ),
    );
  }
}
