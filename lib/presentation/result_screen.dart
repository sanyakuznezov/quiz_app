


 import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_constants.dart';
import '../resources/app_images.dart';

class ResultScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     body: Container(
         decoration:  BoxDecoration(
         image: DecorationImage(
         image: AssetImage(bgMain),
      fit: BoxFit.fill)),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: color125,width: 2),
              borderRadius: BorderRadius.circular(20),
              color: color128
          ),
          child: Text('Quiz result',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: color125,
                fontSize: 25,
                fontFamily: Constants.silkScreen
            ),),
        ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text('Right answers:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: color125,
                      fontSize: 25,
                      fontFamily: Constants.silkScreen
                  ),),
              ),
              Text('10',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: Constants.silkScreen
                ),),
            ],
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text('Wrong answers:',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: color125,
                    fontSize: 25,
                    fontFamily: Constants.silkScreen
                ),),
            ),
            Text('10',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: Constants.silkScreen
              ),),

          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text('Difficulty level:',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: color125,
                    fontSize: 25,
                    fontFamily: Constants.silkScreen
                ),),
            ),
            Text('10',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: Constants.silkScreen
              ),),

          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text('Themes:',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: color125,
                    fontSize: 25,
                    fontFamily: Constants.silkScreen
                ),),
            ),
            Text('10',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: Constants.silkScreen
              ),),

          ],
        ),

        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color128)
          ),
          onPressed: () async {

          },
          child:  Text('Save result',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: color125,
                fontSize: 20,
                fontFamily: Constants.silkScreen
            ),),
        ),
      ],
      )),
   );
  }




}