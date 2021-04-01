import 'package:flutter/material.dart';

const kRowTextStyle = TextStyle(
  //decoration: TextDecoration.none,
  fontSize: 100.0,
  fontFamily: 'Spartan',
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
const kEmojiStyle = TextStyle(fontSize: 100.0);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan',
  fontWeight: FontWeight.w700,
  fontSize: 45.0,
  color: Colors.white,
);

const kDescriptionTextStyle =TextStyle(
  fontFamily: 'Spartan',
  fontWeight: FontWeight.w400,
  color: Colors.white,
  fontSize: 20.0,
);

const kTextFieldInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
   // size: 30.0,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
