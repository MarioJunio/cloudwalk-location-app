// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloudwalk_location/src/app/home/home_di.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'src/app/home/presentation/home_screen.dart';
import 'src/app/shared/shared_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.init((await getApplicationDocumentsDirectory()).path);

  setupLocators();

  runApp(const CloudwalkLocationApp());
}

setupLocators() {
  return [
    SharedDi(),
    HomeDi(),
  ].forEach((di) => di.setupBinds());
}

class CloudwalkLocationApp extends StatelessWidget {
  const CloudwalkLocationApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'My Location',
        theme: ThemeData(
          colorScheme: ColorScheme.light(primary: Colors.grey.shade200),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      );
}
