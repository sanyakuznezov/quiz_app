


  import 'package:flutter/material.dart';
import 'package:quiz_app/resources/app_colors.dart';

import '../resources/app_images.dart';
import '../resources/constants.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final List<String> _listDifficulty=['Easy', 'Medium', 'Hard'];
  final List<String> _listTopics=['Linux', 'Medium', 'Hard'];
  String _typeDifficulty='Easy';
  String _typeTopics='Linux';
  bool _isReady=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration:  BoxDecoration(
            image: DecorationImage(
                image: AssetImage(bgMain),
                fit: BoxFit.fill)),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: color125,width: 2),
                borderRadius: BorderRadius.circular(20),
                color: color128
              ),
              child: Text('Quiz\nsetting',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color125,
                  fontSize: 30,
                  fontFamily: Constants.silkScreen
              ),),
            ),
            const SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Difficulty level',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: color125,
                    fontSize: 20,
                    fontFamily: Constants.silkScreen
                ),),

              DropdownButton<String>(
                value: _typeDifficulty,
                alignment: Alignment.center,
                dropdownColor: color128,
                style: const TextStyle(color:Colors.white,
                    fontSize: 17,
                    fontFamily: Constants.silkScreen),
                underline: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
                items: List.generate(_listDifficulty.length, (index){
                  return DropdownMenuItem<String>(
                    value: _listDifficulty[index],
                    child: Text(_listDifficulty[index]),
                  );
                }),
                onChanged: (String? value) {
                  setState((){
                    _typeDifficulty=value!;
                  });

                },

              )

            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Topics of questions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: color125,
                      fontSize: 20,
                      fontFamily: Constants.silkScreen
                  ),),

                DropdownButton<String>(
                  value: _typeTopics,
                  alignment: Alignment.center,
                  dropdownColor: color128,
                  style: const TextStyle(color:Colors.white,
                      fontSize: 17,
                      fontFamily: Constants.silkScreen),
                  underline: Container(
                    height: 2,
                    color: Colors.transparent,
                  ),
                  items: List.generate(_listTopics.length, (index){
                    return DropdownMenuItem<String>(
                      value: _listTopics[index],
                      child: Text(_listTopics[index]),
                    );
                  }),
                  onChanged: (String? value) {
                    setState((){
                      _typeTopics=value!;
                    });

                  },

                )

              ],),
            const SizedBox(height: 70),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: _isReady?MaterialStateProperty.all(color128):MaterialStateProperty.all(color128_40)
              ),
              onPressed: () async {

                },
              child:  Text('Start the quiz',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: _isReady?color125:color125_40,
                    fontSize: 20,
                    fontFamily: Constants.silkScreen
                ),),
            ),
          ],
        ),
      ),
    );
  }
}