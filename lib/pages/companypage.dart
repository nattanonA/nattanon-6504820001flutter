import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Company Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/test2.png'),
              fit: BoxFit.cover,
            ),
            SafeArea(
                child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Nattanon',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  builderRowFooter2(),
                  Divider(),
                  builderWrapFooter(),
                  Divider(),
                  builderRowFooter(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Row builderRowFooter2() {
    return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.phone_android,
                          color: Colors.yellowAccent,
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [Text('Nattanon')],
                        ),
                        Row(
                          children: [Text('091-7123581')],
                        )
                      ],
                    ),
                  ],
                );
  }

  Wrap builderWrapFooter() {
    return Wrap(
                  spacing: 8,
                  children: List.generate(
                      5,
                      (index) => Chip(
                            label: Text('Label'),
                            avatar: Icon(Icons.star),
                            backgroundColor: Colors.orange,
                          )),
                );
  }

  Row builderRowFooter() {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/test3.jpg'),
                      radius: 40,
                    ),
                    SizedBox(
                      width: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.access_alarm),
                          Icon(Icons.accessibility),
                          Icon(Icons.account_balance),
                        ],
                      ),
                    )
                  ],
                );
  }
}
