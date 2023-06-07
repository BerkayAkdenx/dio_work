import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loaddata/models/load_data_model.dart';

class LoadDataPage extends StatefulWidget {
  const LoadDataPage({super.key});

  @override
  State<LoadDataPage> createState() => _LoadDataPageState();
}

class _LoadDataPageState extends State<LoadDataPage> {
  Future<LoadData> apiCall() async {
    const String apiUrl =
        'https://raw.githubusercontent.com/alimcevik/jsonapi/master/api.json';
    final response = await Dio().get(apiUrl);
    print(response.statusCode);
    print(response.statusMessage);
    if (response.statusCode == 200) {
      return LoadData.fromJson(json.decode(response.data));
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<LoadData>(
        future: apiCall(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                children: [
                  Text("kullanici adi : ${snapshot.data!.username}"),
                  Text("kullanici adi : ${snapshot.data!.email}"),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
