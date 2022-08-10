
part of 'app_bloc.dart';


  class AppState extends Equatable{

  final QuizStatus qStatus;
  final String error;



   const AppState(this.qStatus,this.error);

   AppState copyWith({QuizStatus? qStatus,String? error}){
     return AppState(qStatus??this.qStatus,error??this.error);
   }

  factory AppState.unknown() {
    return const AppState(QuizStatus.loading,'');
  }

  @override
  List<Object?> get props => [qStatus,error];




  }