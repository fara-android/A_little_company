
import 'package:employee/screens/mainScreen.dart/mainScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: MainScreen(),
      theme: ThemeData(
        
        scaffoldBackgroundColor: Color(0xffE5E5E5),
        canvasColor: Colors.transparent
      ),
    );
  }
}
