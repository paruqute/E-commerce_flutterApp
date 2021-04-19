import 'package:dapp/Screens/Products.dart';
import 'package:flutter/material.dart';
import 'package:dapp/NavBar_Components/User_profile.dart';
import 'Screens/Products.dart';
import 'constraints.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '3D',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: PrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: TextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {'/profile':(context)=>Profile()},
    );
  }
}
