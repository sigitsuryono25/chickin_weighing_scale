import 'dart:math';

class TaskItemModel {
  int id;
  String? taskName;
  String? date;
  String? type;
  String? from;

  TaskItemModel(this.id, this.taskName, this.date, this.type, this.from);

  Map<String, dynamic> toJson() => {
        'id': id,
        'taskName': taskName,
        'date': date,
        'type': type,
        'from': from,
      };

  TaskItemModel.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        taskName = json['taskName'],
        date = json['date'],
        type = json['type'],
        from = json['from'];
}
