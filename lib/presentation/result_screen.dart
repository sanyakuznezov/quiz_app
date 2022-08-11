


 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/app_bloc/app_bloc.dart';
import 'package:quiz_app/utils/data_result.dart';

import '../resources/app_colors.dart';
import '../resources/app_constants.dart';
import '../resources/app_images.dart';


class ResultScreen extends StatelessWidget{
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Result date= ${DataResult.getDate} wa= ${DataResult.getWrongAnswer} ra= ${DataResult.getRightAnswer} theme= ${DataResult.getThemes} diff= ${DataResult.getDifficulty}');
   return  Scaffold(
     body: Container(
         decoration:  BoxDecoration(
         image: DecorationImage(
         image: AssetImage(bgMain),
      fit: BoxFit.fill)),
      width: double.infinity,
      height: double.infinity,
      child: BlocConsumer<AppBloc,AppState>(
        listener: (_,s){
          if(s.qStatus==QuizStatus.error){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s.error)));

          }

        },
        builder: (context,state) {

          if(state.qStatus==QuizStatus.successLoadResult){
                 return Center(
                   child:  Container(
                     padding: const EdgeInsets.all(10),
                     decoration: BoxDecoration(
                         border: Border.all(color: color125,width: 2),
                         borderRadius: BorderRadius.circular(20),
                         color: color128
                     ),
                     child: Text('Result saved',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                           color: color125,
                           fontSize: 25,
                           fontFamily: Constants.silkScreen
                       ),),
                   ),
                 );
          }
          if(state.qStatus==QuizStatus.loadingResult){
            return const Center(child:  CircularProgressIndicator());
          }
          return Column(
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
                  Text(DataResult.getRightAnswer,
                    textAlign: TextAlign.center,
                    style:const  TextStyle(
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
                Text(DataResult.getWrongAnswer,
                  textAlign: TextAlign.center,
                  style:const TextStyle(
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
                Text(DataResult.getDifficulty,
                  textAlign: TextAlign.center,
                  style:const TextStyle(
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
                Text(DataResult.getThemes,
                  textAlign: TextAlign.center,
                  style:const TextStyle(
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
                 context.read<AppBloc>().add(SaveStatistics(map: DataResult.getResult));
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
          );
        }
      )),
   );
  }




}