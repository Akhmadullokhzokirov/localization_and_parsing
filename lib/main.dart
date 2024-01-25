import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:localization/packages/detail_page.dart';
import 'package:localization/packages/home_page.dart';
import 'package:localization/packages/network_employees.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        // Locale('ru', 'RU'),
        // Locale('uz', 'UZ'),
        // Locale('fr', 'CH'),
        Locale('ko', 'KOR'),
        Locale('ja', 'JPN'),
      ],
      path: 'assets/translation',
      fallbackLocale: Locale('en', 'US'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        NetEmployees.id: (context) => const NetEmployees(),
        DetailPage.id: (context) => const DetailPage(index: 0,),
      },
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
