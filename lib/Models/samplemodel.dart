import 'dart:convert';

SampleDataModel sampleDataModelFromJson(String str) =>
    SampleDataModel.fromJson(json.decode(str));
String sampleDataModelToJson(SampleDataModel data) =>
    json.encode(data.toJson());

class SampleDataModel {
  SampleDataModel({
    required this.isSuccess,
    required this.data,
    required this.message,
  });

  final bool isSuccess;
  final DataModel data;
  final String message;

  factory SampleDataModel.fromJson(Map<String, dynamic> json) =>
      SampleDataModel(
        isSuccess: json["is_success"],
        data: DataModel.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "is_success": isSuccess,
        "data": data.toJson(),
        "message": message,
      };
}

class DataModel {
  DataModel({
    required this.trainings,
  });

  final List<TrainingModel> trainings;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        trainings: List<TrainingModel>.from(
            json["trainings"].map((data) => TrainingModel.fromJson(data))),
      );

  Map<String, dynamic> toJson() => {
        "trainings": List<dynamic>.from(trainings.map((data) => data.toJson())),
      };
}

class TrainingModel {
  TrainingModel({
    required this.month,
    required this.trainingEvents,
  });

  final String month;
  final List<TrainingEventModel> trainingEvents;

  factory TrainingModel.fromJson(Map<String, dynamic> json) => TrainingModel(
        month: json["Month"],
        trainingEvents: List<TrainingEventModel>.from(json["training_events"]
            .map((data) => TrainingEventModel.fromJson(data))),
      );

  Map<String, dynamic> toJson() => {
        "Month": month,
        "training_events":
            List<dynamic>.from(trainingEvents.map((data) => data.toJson())),
      };
}

class TrainingEventModel {
  TrainingEventModel({
    required this.date,
    required this.day,
    required this.events,
  });

  final DateTime date;
  final String day;
  final List<EventModel> events;

  factory TrainingEventModel.fromJson(Map<String, dynamic> json) =>
      TrainingEventModel(
        date: DateTime.parse(json["Date"]),
        day: json["Day"],
        events: List<EventModel>.from(
            json["Events"].map((data) => EventModel.fromJson(data))),
      );

  Map<String, dynamic> toJson() => {
        "Date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "Day": day,
        "Events": List<dynamic>.from(events.map((data) => data.toJson())),
      };
}

class EventModel {
  EventModel({
    required this.id,
    required this.status,
    required this.te,
  });

  final int id;
  final String status;
  final TeModel te;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        status: json["status"],
        te: TeModel.fromJson(json["TE"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "TE": te.toJson(),
      };
}

class TeModel {
  TeModel({
    required this.tmName,
  });

  final String tmName;

  factory TeModel.fromJson(Map<String, dynamic> json) => TeModel(
        tmName: json["tm_name"],
      );

  Map<String, dynamic> toJson() => {
        "tm_name": tmName,
      };
}
