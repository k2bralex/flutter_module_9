import 'package:flutter/material.dart';
import 'package:flutter_module_9/models/hotel.dart';

import 'about_page.dart';
import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: "/",
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case MyHomePage.routeName:
              return MaterialPageRoute(builder: (BuildContext context) {
                return const MyHomePage(
                  title: 'Module 9',
                );
              });
            case AboutPage.routeName:
              final args = settings.arguments as String;
              return MaterialPageRoute(builder: (BuildContext context) {
                return AboutPage(
                  uuid: args,
                );
              });
          }
        });
  }
}
