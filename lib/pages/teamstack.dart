import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/TeamPage.dart';

class TeamStack extends StatefulWidget {
  const TeamStack({Key? key});

  @override
  _TeamStackState createState() => _TeamStackState();
}

class _TeamStackState extends State<TeamStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'teamstack/teams',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'teamstack/teams':
            builder = (BuildContext context) => TeamPage(); 
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}