import 'package:com_nicodevelop_howareyou/models/mood_model.dart';
import 'package:hive/hive.dart';

class MoodRepository {
  final Box moodsBox;

  const MoodRepository({
    required this.moodsBox,
  });

  Future<void> get() async {}

  Future<List<MoodModel>> list() async {
    final List<MoodModel> moods = [];

    for (final key in moodsBox.keys) {
      final MoodModel mood = MoodModel.fromJson(
        Map<String, dynamic>.from(
          moodsBox.get(key),
        ),
      );

      moods.add(mood);
    }

    moods.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return moods;
  }

  Future<void> create(Map<String, dynamic> data) async {
    final MoodModel mood = MoodModel.fromJson({
      "mood": data["mood"]["id"],
      "activity": data["activity"]["id"],
      "description": data["description"],
      "createdAt": DateTime.now(),
      "updatedAt": DateTime.now(),
    });

    await moodsBox.put(mood.key, mood.toJson());
  }

  Future<void> update(Map<String, dynamic> data) async {}

  Future<void> createOrUpdate(Map<String, dynamic> data) async {}

  Future<void> delete(Map<String, dynamic> data) async {}
}
