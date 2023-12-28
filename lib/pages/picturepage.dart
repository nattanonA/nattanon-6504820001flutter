import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PicturePage extends StatefulWidget {
  const PicturePage({super.key});

  @override
  State<PicturePage> createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  Map? picture;
  @override
  Widget build(BuildContext context) {
    picture = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Picture Page'),
      ),
      body: Container(
          child: Image.file(
            File(picture!['path']),
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.file_upload),
          onPressed: () async {
            //convert image to base64
            final bytes = await File(picture!['path']).readAsBytes();
            print('byte is ${bytes}');
            var base64Image = convert.base64Encode(bytes);
            print('base64 is ${base64Image}');
            var url = Uri.parse('https://www.noraphat.dev/web_api/upload/');
            var response = await http.post(url,
                headers: {'Content-Type': 'application/json'},
                body: convert.jsonEncode(
                    {'imageData': 'data:image/jpeg;base64,' + base64Image}));
            if (response.statusCode == 200) {
              var feedback = convert.jsonDecode(response.body);
              print(feedback);
              Future.delayed(Duration(seconds: 3), () {
                Navigator.pop(context);
              });
            } else {
              print('error from backend');
            }
          },
        )
    );
  }
}