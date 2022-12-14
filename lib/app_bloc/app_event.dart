
part of 'app_bloc.dart';

 abstract class AppEvent extends Equatable{


  const AppEvent();

  @override
  List<Object> get props=>[];
}



 class GetQuiz extends AppEvent{
  final  String difficulty;
  final  String topics;
  const GetQuiz({required this.difficulty,required this.topics});
 }
 class SaveStatistics extends AppEvent{
   final Map<String,dynamic> map;
   const SaveStatistics({required this.map});
 }

 class InitApp extends AppEvent{

 }

