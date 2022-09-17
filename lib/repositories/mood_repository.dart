import 'package:hive/hive.dart';

class MoodRepository {
  final Box moodsBox;

  const MoodRepository({
    required this.moodsBox,
  });

  Future<void> get() async {}

  Future<void> list() async {}

  Future<void> create(Map<String, dynamic> data) async {}

  Future<void> update(Map<String, dynamic> data) async {}

  Future<void> createOrUpdate(Map<String, dynamic> data) async {}

  Future<void> delete(Map<String, dynamic> data) async {}
}
