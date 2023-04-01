// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Color.fromARGB(255, 17, 16, 19),
  hintText: '  🔍  Search',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide.none),
);

const kTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

const kFontStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

const kActiveBorderColor = Color.fromARGB(255, 33, 150, 243);
const kInactiveBorderColor = Color.fromARGB(255, 17, 16, 19);

const kTextColor = TextStyle(color: Color.fromARGB(255, 135, 135, 135));

var details = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Rate', style: kTextColor),
        SizedBox(height: 13),
        Text('Slippage tolerance', style: kTextColor),
        SizedBox(height: 13),
        Text('Estimated Fees', style: kTextColor),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('1 AVAX = 1.16 OKB'),
        SizedBox(height: 13),
        Text('1.29%'),
        SizedBox(height: 13),
        Text('0.076 ETH'),
      ],
    ),
  ],
);

var slippage = Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    Slider(
      value: 5,
      min: 1,
      max: 5,
      onChanged: (double newValue) {},
    ),
    SizedBox(height: 12),
    Padding(
      padding: const EdgeInsets.only(right: 11.0),
      child: Text(
        'done',
        style: TextStyle(color: Colors.blue),
      ),
    )
  ],
);
