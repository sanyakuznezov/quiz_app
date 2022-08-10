


  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/app_bloc/app_bloc.dart';
import 'package:quiz_app/presentation/quiz_screen.dart';
import 'package:quiz_app/resources/app_colors.dart';

import '../resources/app_images.dart';
import '../resources/app_constants.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final List<String> _listDifficulty=['Easy', 'Medium', 'Hard'];
  final List<String> _listTopics=['Linux', 'DevOps', 'Networking','Kubernetes'];
  String _typeDifficulty='Easy';
  String _typeTopics='Linux';



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
        child: BlocConsumer<AppBloc,AppState>(
          builder: (context,state) {
            if(state.qStatus==QuizStatus.successLoadQuiz||state.qStatus==QuizStatus.error){
              return Column(
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
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text('Difficulty level',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: color125,
                              fontSize: 20,
                              fontFamily: Constants.silkScreen
                          ),),
                      ),

                      DropdownButton<String>(
                        value: _typeDifficulty,
                        alignment: Alignment.center,
                        dropdownColor: color128,
                        iconEnabledColor: Colors.white,
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
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text('Topics of questions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: color125,
                              fontSize: 20,
                              fontFamily: Constants.silkScreen
                          ),),
                      ),

                      DropdownButton<String>(
                        value: _typeTopics,
                        alignment: Alignment.center,
                        dropdownColor: color128,
                        iconEnabledColor: Colors.white,
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
                        backgroundColor: MaterialStateProperty.all(color128)
                    ),
                    onPressed: () async {
                         context.read<AppBloc>().add(GetQuiz(topics: _typeTopics,difficulty: _typeDifficulty));
                    },
                    child:  Text('Start the quiz',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: color125,
                          fontSize: 20,
                          fontFamily: Constants.silkScreen
                      ),),
                  ),
                ],
              );


            }else{
              return const CircularProgressIndicator();
            }

          }, listener: ( context,stateListener) {
          if(stateListener.qStatus==QuizStatus.error){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(stateListener.error)));

          }

          if(stateListener.qStatus==QuizStatus.successLoadQuiz){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizScreen()));
          }
        },
        ),
      ),
    );
  }
}