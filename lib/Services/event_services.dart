import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

import '../Models/samplemodel.dart';

Future<List<TrainingEventModel>> readJsonData() async {
  final jsondata = await rootBundle.loadString('assets/mydata.json');
  final data = json.decode(jsondata);
  SampleDataModel sampleDataModel = SampleDataModel.fromJson(data);
  List<TrainingEventModel> traininglist =
      sampleDataModel.data.trainings[0].trainingEvents;
  return traininglist;
}
