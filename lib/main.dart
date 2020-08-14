import 'package:flutter/material.dart';
import 'package:user_preferences/src/routes/routes.dart';
import 'package:user_preferences/src/share_prefs/user_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPrefs();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = UserPrefs();

    return MaterialApp(
      title: 'User Preferences',
      debugShowCheckedModeBanner: false,
      initialRoute: prefs.lastPage,
      routes: getAppRoutes(),
    );
  }
}
