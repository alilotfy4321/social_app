// ignore_for_file: camel_case_types

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:social_app/controller/bloc_observer.dart';
import 'package:social_app/controller/login/login_cubit.dart';
import 'package:social_app/controller/reister/reister_cubit.dart';
import 'package:social_app/firebase_options.dart';
import 'package:social_app/generated/l10n.dart';
import 'package:social_app/shared_in_app/themes.dart';
import 'package:social_app/view/authontication/register/register.dart';







void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MultiBlocProvider(
      providers: [
        BlocProvider<SocialReisterCubit>(create: (context) => SocialReisterCubit()),
        BlocProvider<SocialLoginCubit>(create: (context) => SocialLoginCubit()),

      ],
      child: 
      MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('en'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: lightTheme,
      //themeMode: isDark?darkTheme:lightTheme,
      home: RegisterScreen(),
    ),
      
    ); 
    
  }
}


