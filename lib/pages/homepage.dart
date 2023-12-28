import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/footer.dart';
import 'package:flutter_application_1/widgets/logo.dart';
import 'package:flutter_application_1/widgets/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //ALT+Shift+F to auto realigntment the copy code
        drawer: Menu(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('test flutter'),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/testbg.jpg'),
                  fit: BoxFit.fill)),
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'homestack/company');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.business,
                        size: 80,
                        color: Colors.blue,
                      ),
                      Text(
                        'Company',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'homestack/map' ,);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.map,
                        size: 80,
                        color: Colors.blue,
                      ),
                      Text(
                        'Map',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'homestack/camera' ,);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 80,
                        color: Colors.blue,
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'homestack/about' , arguments: {
                    'email' : 'nattanon_w@hotmail.com',
                    'telephone number' : '0917123581'
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.blue,
                      ),
                      Text(
                        'About Me',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
