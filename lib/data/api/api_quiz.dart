


 import 'package:dio/dio.dart';
import 'package:quiz_app/data/dio_client/dio_client_quiz.dart';
import 'package:quiz_app/data/models/model_quiz.dart';
import 'package:quiz_app/resources/app_constants.dart';

import '../../locator.dart';
import '../../utils/failure.dart';

class ApiQuiz{
   static final _dio=locator.get<DioClientQuiz>().init();


   static Future<List<ModelQuiz>?> getQuiz({required String category,required String difficulty})async{

     try{
       final result=await _dio.get('/questions',queryParameters: {
         'category':category,
         'apiKey':Constants.apiKey,
         'difficulty':difficulty,
         'limit':10
       });

       if(result.statusCode==200){
         print('Result Api ${result.data}');
         return (result.data as List)
             .map((x) => ModelQuiz.fromJSON(map: x))
             .toList();

       }

     }on DioError catch(error){
       
       print("Error Api ${error}");
       if(error.response==null){
         return throw Failure.fromDioError(error);
       }

       if(error.response!.statusCode==401){
         return throw const Failure('Unauthenticated');
       }

       if(error.response!.statusCode==404){
         return throw const Failure('No questions found');
       }

       if(error.response!.statusCode==429){
         return throw const Failure('Too Many Requests');
       }


     }
     return null;
   }



 }