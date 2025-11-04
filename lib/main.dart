import 'package:bitaqwa_app_idn_project_agha/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      // '/' buat ngasih nama routes
      // '/zakat' buat ngasih nama alias dari hlmn zakat
      routes: {'/': (context) => Home_Page()},
      debugShowCheckedModeBanner: false,
    );
  }
}
