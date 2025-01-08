import 'package:flutter/material.dart';
import 'package:flutter_tutorial/GetX/Views/GetxHome.dart';
import 'package:flutter_tutorial/config/routes.dart';
import 'package:flutter_tutorial/views/home_page.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Provider/Notifier/ThemeNotifier.dart';
import 'helpers/Localization/AppLanguage.dart';
import 'helpers/Localization/myLocal.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';
import 'views/login_page.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Create an instance of AppLanguage and initialize it
//   final appLanguage = AppLanguage();
//    appLanguage.onInit(); // Ensure the language is loaded before app starts
//   // Register AppLanguage instance in GetX
//   Get.put(appLanguage);
//   runApp(MyApp(appLanguage: appLanguage));
// }
//
// class MyApp extends StatelessWidget {
//   final AppLanguage appLanguage;
//
//   const MyApp({Key? key, required this.appLanguage}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       translations: translate(), // Add translations
//       locale: Locale(Get.find<AppLanguage>().appLocal.value), // Dynamically set locale
//       fallbackLocale: Locale('en'), // Fallback language
//       home: GetxHome(),
//     );
//   }
// }


void main() {

  //runApp(const MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child:  MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
      return MaterialApp(
          theme: themeProvider.currentTheme,
          darkTheme: darkTheme,
          themeMode: themeProvider.themeMode,
          initialRoute: baseRoute,
          navigatorKey: RouterManager.navigatorKey,
          onGenerateRoute: RouterManager.generateRoute,
          debugShowCheckedModeBanner: false,
          home: Scaffold( // Add Scaffold here
      appBar: AppBar(
      title: Text('My App'),
    actions: [
    Switch(
    value: themeProvider.themeMode == ThemeMode.dark, // Access themeMode directly
    onChanged: (bool value) {
    themeProvider.toggleTheme();
    },
    ),
    ],
      ),
            // ... rest of your UI ...
          ),
      );
        },
    );
  }
}
