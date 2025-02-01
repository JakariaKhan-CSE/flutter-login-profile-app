// here get and post api class
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../app_exception.dart';
import 'baseapi.dart';

class NetworkApiServices extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async{
    dynamic responseJson;
    try{
      // 5 second timeout set korsi
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 5));
      responseJson = returnResponse(response);
    }on SocketException{
      // FetchDataException this class already i create in api_response.dart file
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson;
    try{
      // 5 second timeout set korsi
      final response = await http.post(Uri.parse(url),
          body: data  // this data send to backend via body
      ).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      // FetchDataException this class already i create in api_response.dart file
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException('Error Occurred when communicating with server '+
            'with Status Code: ' + response.statusCode.toString());
    }
  }

}