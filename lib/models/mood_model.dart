import 'package:hive/hive.dart';

part 'mood_model.g.dart';

@HiveType(typeId: 1)
class MoodModel {
  @HiveField(0)
  final String mood;
  @HiveField(1)
  final String activity;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime createdAt;
  @HiveField(4)
  final DateTime updatedAt;

  const MoodModel({
    required this.mood,
    required this.activity,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MoodModel.fromJson(Map<String, dynamic> json) => MoodModel(
        mood: json['mood'],
        activity: json['activity'],
        description: json['description'],
        createdAt: json['createdAt'] is String
            ? DateTime.parse(json['createdAt'])
            : json['createdAt'],
        updatedAt: json['updatedAt'] is String
            ? DateTime.parse(json['updatedAt'])
            : json['updatedAt'],
      );

  String get key =>
      "$mood-$activity-${createdAt.millisecondsSinceEpoch}".hashCode.toString();

  Map<String, dynamic> toJson() => {
        'mood': mood,
        'activity': activity,
        'description': description,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  @override
  String toString() =>
      'MoodModel(mood: $mood, activity: $activity, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
}
