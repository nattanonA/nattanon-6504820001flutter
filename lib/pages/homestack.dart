import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/aboutpage.dart';
import 'package:flutter_application_1/pages/camerapage.dart';
import 'package:flutter_application_1/pages/contactpage.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/companypage.dart';
import 'package:flutter_application_1/pages/mappage.dart';
import 'package:flutter_application_1/pages/picturepage.dart';
class HomeStack extends StatefulWidget {
  const HomeStack({super.key});

  @override
  State<HomeStack> createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'homestack/home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'homestack/home':
            // Assume CollectPersonalInfoPage collects personal info and then
            // navigates to 'signup/choose_credentials'.
            builder = (BuildContext context) => HomePage();
            break;
          case 'homestack/about':
            builder = (BuildContext context) => AboutPage();
            break;
          case 'homestack/contact':
            builder = (BuildContext context) => ContactPage();
            break;
          case 'homestack/company':
            builder = (BuildContext context) => CompanyPage();
            break;
          case 'homestack/camera':
            builder = (BuildContext context) => CameraPage();
            break;
          case 'homestack/picture':
            builder = (BuildContext context) => PicturePage();
            break;
          case 'homestack/map':
            builder = (BuildContext context) => MapPage();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}