// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'constants.dart';

List<Widget> content = [];

showBottom(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            color: Color.fromARGB(255, 38, 45, 52),
          ),
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Select an asset', style: kTextStyle),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: kTextFieldInputDecoration,
                ),
              ),
              Text('Popular tokens'),
              Column(
                children: content,
              ),
            ],
          ),
        ),
      );
    },
  );
}

class Resuse extends StatelessWidget {
  String? img;
  String? name;
  String? abbr;

  Resuse(
      {super.key, required this.name, required this.abbr, required this.img});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          width: 44,
          image: NetworkImage(img!),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name!),
            SizedBox(height: 6),
            Text(abbr!),
          ],
        ),
        Spacer(),
        Text('₹100,758.98')
      ],
    );
  }
}
