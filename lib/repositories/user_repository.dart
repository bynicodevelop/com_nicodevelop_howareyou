import 'package:com_nicodevelop_howareyou/models/user_model.dart';
import 'package:hive/hive.dart';

class UserRepository {
  final Box settingsBox;

  const UserRepository({
    required this.settingsBox,
  });

  Future<UserModel> get() async {
    final Map<String, dynamic> user = Map.from(settingsBox.get("user") ?? {});

    return UserModel.fromJson(user);
  }

  Future<void> list() async {}

  Future<void> create(Map<String, dynamic> data) async {
    final UserModel user = UserModel.fromJson(data);

    settingsBox.put("user", user.toJson());
  }

  Future<void> update(Map<String, dynamic> data) async {
    final UserModel user = UserModel.fromJson(data);

    settingsBox.put("user", user.toJson());
  }

  Future<void> createOrUpdate(Map<String, dynamic> data) async {
    final UserModel user = UserModel.fromJson(data);

    settingsBox.put("user", user.toJson());
  }

  Future<void> delete() async => await settingsBox.delete("user");
}
