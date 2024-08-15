import 'package:flutter/material.dart';
import 'package:palomaps_project/di/injection.dart';
import 'package:palomaps_project/extensions/theme_extensions.dart';
import 'package:palomaps_project/presentation/screens/main/main_page.dart';

Future<void> main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: context.colors.onPrimary, elevation: 0, centerTitle: true),
          primaryColor: context.colors.onPrimary,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: context.colors.black,
              unselectedItemColor: context.colors.black),
          textTheme: TextTheme(
              displayMedium: TextStyle(
            color: context.colors.black,
          )),
          useMaterial3: false,
        ),
        home: const MainPage());
  }
}
