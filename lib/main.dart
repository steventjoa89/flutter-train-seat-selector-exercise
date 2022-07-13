import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket/app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Train App',
      initialRoute: Routes.SELECT_TICKET,
      getPages: AppPages.routes,
    );
  }
}
