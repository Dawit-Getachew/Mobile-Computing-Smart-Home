import 'package:hive/hive.dart';

part 'user.g.dart';
@HiveType(typeId: 0)
class User extends HiveObject{
  @HiveField(0)
  late String firstName;

  @HiveField(1)
  late String lastName;

  @HiveField(2)
  late String phoneNumber;

  @HiveField(3)
  late String password;
}