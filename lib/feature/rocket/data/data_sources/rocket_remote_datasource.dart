import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/rocket_model.dart';

class RocketRemoteDataSource {
  final dio = Dio();

  RocketRemoteDataSource() {
    dio.options.headers['Content-Type'] = 'application/json';
  }

  Future<List<RocketModel>> getRockets() async {
    try {
      List<RocketModel> rockets = [];
      debugPrint("api call started");
      final response = await dio.get('https://api.spacexdata.com/v4/rockets');
      debugPrint("api call completed");
      debugPrint("response: ${response.data}");
      for (var rocket in response.data) {
        rockets.add(RocketModel.fromJson(rocket));
      }
      return rockets;
    } catch (e) {
      rethrow;
    }
  }
}
