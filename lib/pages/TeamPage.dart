import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/team.dart';
import 'package:flutter_application_1/pages/mappage3.dart';
import 'package:flutter_application_1/widgets/menu.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  List<TeamName>? teamname = [];
  bool isLoading = true;

  Future<void> _getdata() async{
    var url = Uri.parse('https://noraphat.dev/web_api/get_team_name/');
    var response = await http.get(url);
    if(response.statusCode == 200){
      final Team team = Team.fromJson(convert.jsonDecode(response.body));
      setState(() {
        teamname = team.teamname;
        isLoading = false;
      });
    }else{
      print('Error from backend ${response.statusCode}');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ALT+Shift+F to auto realigntment the copy code
      drawer: Menu(),
      appBar: AppBar(
        
        title: Text('Team Page'),
      ),
      body: isLoading == true 
      ? Center(
        child: CircularProgressIndicator(),
      )
      : ListView.separated(
        itemBuilder: (BuildContext context,int index){
          return ListTile(
            leading: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: NetworkImage(teamname![index].teamLogo!),
                  fit: BoxFit.cover
                  )
              ),
            ),
            title: Text('${teamname![index].teamName}'),
            //subtitle: Text('Price : ${teamname![index].price} .-'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => MapPage(
                  teamLat: double.parse(teamname![index].teamLat!),
                  teamLong: double.parse(teamname![index].teamLong!),
                  team: teamname![index], // Pass the TeamName instance
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (BuildContext context,int index) => Divider(), 
        itemCount: teamname!.length),
      
    );
  }
}