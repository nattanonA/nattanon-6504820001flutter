import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/aboutpage.dart';
import 'package:flutter_application_1/pages/contactpage.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/homestack.dart';
import 'package:flutter_application_1/pages/loginpage.dart';
import 'package:flutter_application_1/pages/newsstack.dart';
import 'package:flutter_application_1/pages/productstack.dart';
import 'package:flutter_application_1/pages/teamstack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      //home: const HomePage(title: 'nattanon_APP'),
      initialRoute: '/',
      routes: {
        //'/':(context) => LoginPage(),
        '/':(context) => HomeStack(),
        '/homestack':(context) => HomeStack(),
        '/productstack':(context) => ProductStack(),
        '/newsstack':(context) => NewsStack(),
        '/teamstack':(context) => TeamStack(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

