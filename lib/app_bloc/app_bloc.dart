
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:quiz_app/data/api/api_quiz.dart';
import 'package:quiz_app/utils/failure.dart';

import '../data/models/model_quiz.dart';



part 'app_event.dart';
part 'app_state.dart';


 enum QuizStatus{
   loading,
   loaded,
   error,
   loadingQuiz,
   successLoadQuiz
 }

  class AppBloc extends Bloc<AppEvent, AppState>{



    AppBloc():
    super(AppState.unknown()){
      on<GetQuiz>(_getQuiz);
      on<SaveStatistics>(_saveStatistics);
      on<InitApp>(_initApp);
    }


    _getQuiz(GetQuiz event,emit)async{
      emit(state.copyWith(qStatus: QuizStatus.loadingQuiz));
      try{
       final listQuiz=await ApiQuiz.getQuiz(category:event.topics,difficulty: event.difficulty);
        emit(state.copyWith(qStatus: QuizStatus.successLoadQuiz,listQuiz: listQuiz!));
      }on Failure catch(error){
        emit(state.copyWith(qStatus: QuizStatus.error,error: error.message));
      }


    }

    _saveStatistics(event,emit)async{

    }

    _initApp(event,emit)async{
      emit(state.copyWith(qStatus: QuizStatus.loading));
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(qStatus: QuizStatus.successLoadQuiz));
    }



  }

