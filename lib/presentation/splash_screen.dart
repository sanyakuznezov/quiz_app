



  import 'package:flutter/material.dart';
  import 'package:quiz_app/resources/app_constants.dart';
  import 'package:quiz_app/resources/app_colors.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       alignment: Alignment.center,
       width: double.infinity,
       height: double.infinity,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Quiz',style: TextStyle(
            color: colorBlack,
              fontSize: 30,
              fontFamily: Constants.silkScreen
          ),),
          Text('App',style: TextStyle(
            color: color128,
              fontSize: 30,
              fontFamily: Constants.silkScreen
          ),)
        ],
       ),
     ),
   );
  }




}