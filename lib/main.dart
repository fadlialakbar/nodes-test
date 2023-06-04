import 'package:eye_diagnose/server/api.dart';
import 'package:flutter/material.dart';

import 'views/homepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SheetAPI.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nodes',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
