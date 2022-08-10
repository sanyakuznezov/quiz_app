

 import 'package:get_it/get_it.dart';
import 'package:quiz_app/data/api/api_quiz.dart';
import 'package:quiz_app/data/dio_client/dio_client_quiz.dart';


final locator=GetIt.instance;

void setup(){

  locator.registerLazySingleton<DioClientQuiz>(() => DioClientQuiz());

}