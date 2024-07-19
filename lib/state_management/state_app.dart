import 'package:flutter/material.dart';
import 'package:major_cineplex/common/bottom_bar.dart';
import 'package:major_cineplex/state_management/languagesProvider.dart';
import 'package:provider/provider.dart';

Widget providerStateApp(){
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LanguagesProvider()),
    ],
    child: const StateApp(),
  );
}

class StateApp extends StatelessWidget {
  const StateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomBar(),
    );
  }
}