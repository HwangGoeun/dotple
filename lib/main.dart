import 'package:dotple/constants/constants.dart';
import 'package:dotple/constants/style.dart';
import 'package:dotple/model/group_model.dart';
import 'package:dotple/provider/category_provider.dart';
import 'package:dotple/provider/event_provider.dart';
import 'package:dotple/provider/group_provider.dart';
import 'package:dotple/provider/todo_provider.dart';
import 'package:dotple/screens/group/screens/group_in/group_main.dart';
import 'package:dotple/screens/home/home.dart';
import 'package:dotple/screens/login/splash_animation.dart';
import 'package:dotple/screens/login/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CategoryProvider()),
    ChangeNotifierProvider(create: (_) => GroupProvider()),
    ChangeNotifierProvider(create: (_) => TodoProvider()),
    ChangeNotifierProvider(create: (_) => EventProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Status bar color
      statusBarIconBrightness: Brightness.dark, // Status bar icon color
    ));

    return MaterialApp(
      theme: dotPleTheme,
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (BuildContext context) => CategoryProvider(),
          child: const SafeArea(
            child: Home(),
          ),
        ),
      ),
    );
  }
}
