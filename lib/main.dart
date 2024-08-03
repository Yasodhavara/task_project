import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_project/pages/lpn_list/lpn_list_screen.dart';
import 'package:task_project/serviceLocator.dart';

Future<void> main() async {
  await initServiceProvider();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
      ),
      debugShowCheckedModeBanner: false,
        home: LpnListScreen(),
    );
  }
}
