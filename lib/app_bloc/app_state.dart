
part of 'app_bloc.dart';


  class AppState extends Equatable{

  final QuizStatus qStatus;
  final String error;
  final List<ModelQuiz> listQuiz;



   const AppState(this.qStatus,this.error,this.listQuiz);

   AppState copyWith({QuizStatus? qStatus,String? error,List<ModelQuiz>? listQuiz}){
     return AppState(qStatus??this.qStatus,error??this.error,listQuiz??this.listQuiz);
   }

  factory AppState.unknown() {
    return const AppState(QuizStatus.loading,'',[]);
  }

  @override
  List<Object?> get props => [qStatus,error,listQuiz];




  }