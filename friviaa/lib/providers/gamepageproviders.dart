import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class gamepageprovider extends ChangeNotifier{
  final Dio _dio = Dio ();
  final int _maxquest= 10;
  List? questions ;
  int _currentquest =0;
  BuildContext context;
  gamepageprovider({required this.context}){
    _dio.options.baseUrl='https://opentdb.com/api.php';
    _getqfromApi();
  }
  Future<void> _getqfromApi()async{
    var _response = await _dio.get('',
        queryParameters:{'amount':10,
        'type': 'boolean',
        'difficulty':'easy'
        }
        );
    var _data = jsonDecode(_response.toString(),);
    questions = _data["results"];
    notifyListeners();


  }
  String GetCurrentUqestionText (){
    return questions![_currentquest]["question"];
  }
}