// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewHome extends StatefulWidget {
  NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  ResponseModel? responseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    _uploadData().then((value) => {
                          setState(() {
                            responseModel = value;
                          }),
                        });
                  },
                  child: Text('Upload Data'))),
          responseModel == null
              ? Text('')
              : Text(responseModel!.token.toString()),
        ],
      ),
    );
  }
}

Future<ResponseModel> _uploadData() async {
  String url = 'https://reqres.in/api/register';
  http.Response response = await http.post(Uri.parse(url),
      body: {"email": "eve.holt@reqres.in", "password": "pistol"});
  log(response.body);

  return ResponseModel.fromJson(response.body);
}

class ResponseModel {
  final String token;
  final int id;
  ResponseModel({required this.id, required this.token});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'id': id,
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      token: map['token'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
