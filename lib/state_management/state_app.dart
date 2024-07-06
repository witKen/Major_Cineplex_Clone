import 'package:flutter/material.dart';
import 'package:major_cineplex/feature/home/home_screen.dart';
import 'package:major_cineplex/state_management/theme_logic.dart';
import 'package:provider/provider.dart';

Widget providerStateApp(){
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LanguagesProvider()),
    ],
    child: StateApp(),
  );
}

class StateApp extends StatelessWidget {
  const StateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}