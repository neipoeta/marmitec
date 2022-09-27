import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marmitec/routes/route_name.dart';

import 'routes/app_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.login,
      title: 'Flutter Stateful Clicker Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      getPages: AppPage.pages,
    );
  }
}
