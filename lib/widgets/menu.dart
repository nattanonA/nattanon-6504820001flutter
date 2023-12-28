import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children:  <Widget>[
        //DrawerHeader(
        //  decoration: BoxDecoration(
        //    color: Colors.blue,
        //  ),
        //  child: Text(
        //    'Drawer Header',
        //    style: TextStyle(
        //      color: Colors.white,
        //      fontSize: 24,
        //    ),
        //  ),
        //),
        UserAccountsDrawerHeader(
            currentAccountPicture: Icon(Icons.face),
            accountName: Text('Nattanon Amthong'),
            accountEmail: Text('themoobz@gmail.com'),
            otherAccountsPictures: [
              Icon(Icons.bookmark_border),
            ],
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/testbg.jpg'),
                    fit: BoxFit.cover)),
          ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          trailing: Icon(Icons.arrow_right),
          selected: ModalRoute.of(context)?.settings.name == 'homestack/home'
              ? true
              : false,
          onTap:() {
            Navigator.of(context,rootNavigator: true).pushNamedAndRemoveUntil('/homestack', (route) => false);
          },
            
        ),
        ListTile(
          leading: Icon(Icons.all_out),
          title: Text('Product'),
          trailing: Icon(Icons.arrow_right),
          selected: ModalRoute.of(context)?.settings.name == 'productstack/product'
              ? true
              : false,
          onTap:() {
            Navigator.of(context,rootNavigator: true).pushNamedAndRemoveUntil('/productstack', (route) => false);
          },
        ),
        ListTile(
          leading: Icon(Icons.mail),
          title: Text('News'),
          selected: ModalRoute.of(context)?.settings.name == 'newsstack/news'
              ? true
              : false,
          trailing: Icon(Icons.arrow_right),
          onTap:() {
            Navigator.of(context,rootNavigator: true).pushNamedAndRemoveUntil('/newsstack', (route) => false);
          },
        ),
        ListTile(
          leading: Icon(Icons.countertops),
          title: Text('Team'),
          selected: ModalRoute.of(context)?.settings.name == 'teamstack/teams'
              ? true
              : false,
          trailing: Icon(Icons.arrow_right),
          onTap:() {
            Navigator.of(context,rootNavigator: true).pushNamedAndRemoveUntil('/teamstack', (route) => false);
          },
        ),
        
      ],
    ),
  );
  }
}