import 'package:flutter/material.dart';
import 'package:nalo_project/responsive/mobile_screen_layout.dart';
import 'package:nalo_project/responsive/responsive_layout.dart';
import 'package:nalo_project/responsive/web_screen_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResponsiveLayout(
          mobileScreenLayout: MobileHomeScreen(),
          webScreenLayout: WebHomeScreen()),
    );
  }
}
