


 import 'package:dio/dio.dart';
import 'package:quiz_app/data/dio_client/dio_client_quiz.dart';
import 'package:quiz_app/resources/constants.dart';

import '../../locator.dart';

class ApiQuiz{
   static final _dio=locator.get<DioClientQuiz>().init();


   static Future<void> getQuiz({required String category,required String difficulty})async{

     try{
       final result=await _dio.post('/questions',data: {
         'category':category,
         'apiKey':Constants.apiKey,
         'difficulty':difficulty
       });
       print('Result RC ${result.statusCode}');
     }on DioError catch(e){
       print("Error RC ${e}");
     }

   }



 }