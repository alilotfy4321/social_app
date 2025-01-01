// ignore_for_file: camel_case_types

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:social_app/firebase_options.dart';
import 'package:social_app/generated/l10n.dart';
import 'package:social_app/shared_in_app/constants.dart';
import 'package:social_app/shared_in_app/themes.dart';







void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //bool isDark=false;
    return MaterialApp(
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
      home: HomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Row(children: [
        Padding(
          padding:  EdgeInsets.only(right: isArabic()?30:0,left:isArabic()?0:30),
          child: Text(S.of(context).Hello),
        ),
        SizedBox(width: 10,),
        Text(S.of(context).name),
      ],),
    );
  }

  
}
