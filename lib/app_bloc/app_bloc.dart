
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';



part 'app_event.dart';
part 'app_state.dart';


 enum QuizStatus{
   loading,
   loaded,
   error
 }

  class AppBloc extends Bloc<AppEvent, AppState>{

    AppBloc():
    super(AppState.unknown()){
      on<GetQuiz>(_getQuiz);
      on<SaveStatistics>(_saveStatistics);
      on<InitApp>(_initApp);
    }


    _getQuiz(event,emit)async{

    }

    _saveStatistics(event,emit)async{

    }

    _initApp(event,emit)async{
      emit(state.copyWith(qStatus: QuizStatus.loading));
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(qStatus: QuizStatus.loaded));
    }



  }

