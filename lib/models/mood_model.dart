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

  const MoodModel({
    required this.mood,
    required this.activity,
    required this.description,
  });

  factory MoodModel.fromJson(Map<String, dynamic> json) => MoodModel(
        mood: json['mood'],
        activity: json['activity'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'mood': mood,
        'activity': activity,
        'description': description,
      };

  @override
  String toString() =>
      'MoodModel(mood: $mood, activity: $activity, description: $description)';
}
