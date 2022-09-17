import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String firstname;

  const UserModel({
    required this.firstname,
  });

  String get key => firstname.hashCode.toString();

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstname: json['firstname'],
      );

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
      };

  @override
  String toString() => 'UserModel(firstname: $firstname)';
}
