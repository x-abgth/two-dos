import 'package:hive/hive.dart';

part 'todo_db_model.g.dart';

@HiveType(typeId: 0)
class TodoDb {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String subject;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final int themeIndex;

  TodoDb(
      {this.title = "",
      this.subject = "",
      this.date = "",
      this.themeIndex = -1});
}
