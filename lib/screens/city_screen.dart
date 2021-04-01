
import 'package:clima/utilites/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String enteredCityName;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 30.0,bottom:20.0,left:5.0, right: 20.0 ),
                child: TextField(
                  style: TextStyle(color: Colors.black,fontSize: 20.0),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value){
                    enteredCityName = value;
                  },
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context,enteredCityName);
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontFamily: ' Spartan ',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
