import 'package:flutter/material.dart';
import 'package:my_first_app/pages/main_page/calculator_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//import './product_manager.dart';
import './signIn_page.dart';
import 'models/calculator.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorModel(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.redAccent,
          dividerColor: Colors.black,
        ),
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.redAccent,
          dividerColor: Colors.white,
        ),
        themeMode: ThemeMode.system,
        home: const Scaffold(body: SignInPage()),
      ),
    );
  }
}
