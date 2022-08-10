



  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/app_bloc/app_bloc.dart';

class QuizScreen extends StatelessWidget{
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc,AppState>(
      builder: (context,state) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.red,
        );
      }
    );
  }





}