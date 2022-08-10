
part of 'app_bloc.dart';

 abstract class AppEvent extends Equatable{


  const AppEvent();

  @override
  List<Object> get props=>[];
}



 class GetQuiz extends AppEvent{

 }
 class SaveStatistics extends AppEvent{

 }

 class InitApp extends AppEvent{

 }

