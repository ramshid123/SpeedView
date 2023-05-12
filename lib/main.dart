import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:money_tracker/speed_page.dart';
import 'speedometer.dart';
import 'home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}