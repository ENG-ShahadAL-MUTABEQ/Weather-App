import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontSize: 110.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const kMessageTextStyle = TextStyle(
  fontSize: 40.0,
  fontFamily: 'Montserrat',
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  color: Color(0xFF411D45),
  fontFamily: 'Montserrat',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kCityName = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Montserrat',
  color: Colors.white,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
