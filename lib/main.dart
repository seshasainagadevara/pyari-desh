import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pyari_desh/views/favoritePage/favorites_page.dart';

import 'views/homepage/home_page.dart';

void main() {
  //Attaching providerscope of riverpod for state management
  runApp(ProviderScope(child: MyApp()));
}

//MyApp is the root widget of the application
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pyari Desh',
      themeMode: ThemeMode.dark,
      //declaring page routes of the application
      routes: <String, WidgetBuilder>{
        '/favorites': (BuildContext context) => FavoritePage()
      },
      home: HomePage(title: 'Pyari Desh'),
    );
  }
}
