import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_weather_app/models/weather_provider.dart';
import '../home_page.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(                      //provider
      create: (BuildContext context)
      {
        return Weather_Provider();
      },
      child: MaterialApp(debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Home(),
      ),
    );
  }
}

