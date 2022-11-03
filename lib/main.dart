import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wear/wear.dart';
import 'package:wearos_counter/pages/home.dart';

import 'pages/inactive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appPath = await getApplicationDocumentsDirectory();

  Hive.init(appPath.path);
  await Hive.openBox('counters');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'WearOS Counter',
        theme: ThemeData.dark(),
        home: WatchShape(
          builder: (BuildContext context, WearShape shape, Widget? child) {
            return const HomePage();
          },
        ),
        debugShowCheckedModeBanner: false,
      );
}
