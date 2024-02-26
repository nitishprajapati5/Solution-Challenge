import 'dart:convert';

loginresponsemodel loginresponseJson(String str) =>
    loginresponsemodel.fromJson(json.decode(str));
class loginresponsemodel {
  String? message;
  String? messageCode;
  int? statusCode;
  Data? data;
  

  loginresponsemodel(
      {this.message, this.messageCode, this.statusCode, this.data});

  loginresponsemodel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    messageCode = json['MessageCode'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['MessageCode'] = this.messageCode;
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? token;

  Data({this.id, this.name, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['token'] = this.token;
    return data;
  }
}
