import 'package:flutter/material.dart';

class InfoOverlay extends StatelessWidget {
  final String title;
  final String snippet;
  final String? teamLogo;

  InfoOverlay({required this.title, required this.snippet, this.teamLogo});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(snippet),
            if (teamLogo != null)
              Image.network(
                teamLogo!,
                width: 100, // Adjust the width as needed
                height: 100, // Adjust the height as needed
              ),
          ],
        ),
      ),
    );
  }
}