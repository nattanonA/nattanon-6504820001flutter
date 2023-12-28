import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Contact Page'),
      ),
      body: Center(
        child: Column(children: [
          Text('Contact Page'),
          ElevatedButton(onPressed: (){
            Navigator.pushNamedAndRemoveUntil(context,'homestack/home',(Route<dynamic> route) => false);
          }, child: Text('Return home'))
        ]),
      ),
    );
  }
}