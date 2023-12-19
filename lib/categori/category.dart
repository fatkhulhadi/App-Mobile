import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String title;

  const Category({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: 50,
          height: 50,
          child: Center(
            child: Text(
              title,
              // style: GoogleFonts.montserrat(fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
