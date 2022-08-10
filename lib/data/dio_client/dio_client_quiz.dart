

 import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../resources/app_constants.dart';



class DioClientQuiz{

   static SecurityContext? securityContext;

   Dio init() {
     final _dio = Dio(
       BaseOptions(
         baseUrl: Constants.baseUrlQuiz,
         connectTimeout: 15000,
         receiveTimeout: 100000,
         contentType: Headers.jsonContentType,
         responseType: ResponseType.json,
         headers: {
           'X-RapidAPI-Key': '4110db2249msh8f6c4a6500d7790p1d3ecdjsn1667776b296b',
           'X-RapidAPI-Host': 'flashscore.p.rapidapi.com'
         },
       ),
     );

     final httpClientAdapter = _dio.httpClientAdapter;
     if (httpClientAdapter is DefaultHttpClientAdapter) {
       httpClientAdapter.onHttpClientCreate = (_) => HttpClient(
         context: securityContext,
       );
     }
     return _dio;
   }



 }