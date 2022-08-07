
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/homepg.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp(
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,

    theme: ThemeData(primarySwatch: Colors.deepPurple),


      darkTheme: ThemeData(primaryColor: Color.fromARGB(255, 247, 249, 250),
      brightness: Brightness.dark),
      home: homepg(),

    );
    
  }
}
