import 'package:flutter/material.dart';

import 'about_page.dart';
import 'home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

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
            case HomePage.routeName:
              return MaterialPageRoute(builder: (BuildContext context) {
                return const HomePage(
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
