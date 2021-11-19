import 'package:dexter1/dashboard.dart';
import 'package:dexter1/onboardingpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? displayOnboard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  displayOnboard = preferences.getBool('displayOnboard') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/homepage': (context) => Dashboard(),
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.grey.shade300,
      ),
      home: displayOnboard! ? OnBoardingPage() : Dashboard(),
    );
  }
}
