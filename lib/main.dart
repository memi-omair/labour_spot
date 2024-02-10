import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:labourspot/splash_screen.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp((const MaterialApp(
    home: SplashScreen(),
  )));
}





