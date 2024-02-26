import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mindfuldost_hub/config.dart';
import 'package:mindfuldost_hub/models/login_request_model.dart';
import 'package:mindfuldost_hub/models/login_response_model.dart';
import 'package:mindfuldost_hub/models/register_request_model.dart'; 
import 'package:mindfuldost_hub/services/share_service.dart';
class APIService{

  static var client = http.Client();

  static Future<bool> login(loginrequestmodel model) async{
    Map<String,String> requestHeaders = {
      'Content-Type':'application/json',
      
    };
var url=Uri.parse(config.loginurl);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode (model.toJson())
      );
    
    if(response.statusCode == 200 ){
      // shared
      await SharedService.setloginDetails(loginresponseJson(response.body));
      print(response.body);
      return true;
    }else{
      return false;
    }

  }
  static Future<bool> register(registratrationrequestmodel model) async{
    Map<String,String> requestHeaders = {
      'Content-Type':'application/json',
      
    };
var url=Uri.parse(config.registerurl);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode (model.toJson())
      );
    
    if(response.statusCode == 200 ){
      // shared

      return true;
    }else{
      return false;
    }

  }
//   static Future<String> getUserProfile() async{
//     var loginDetails = await SharedService.getLoginDetails();
//     Map<String,String> requestHeaders = {
//       'Content-Type':'application/json',
//       'Authorization':'Basic ${loginDetails!.}'
      
//     };
// var url=Uri.parse(config.appname);
//     var response = await client.get(
//       url,
//       headers: requestHeaders,
//       );
    
//     if(response.statusCode == 200 ){
//       // shared
//       await response.body;
//       // print(response.body);
//       return response.body;
//     }else{
//       return '';
//     }

//   }
}