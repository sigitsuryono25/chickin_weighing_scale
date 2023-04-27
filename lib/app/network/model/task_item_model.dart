class TaskItemModel {
  String? taskName;
  String? date;
  String? type;
  String? from;

  TaskItemModel(this.taskName, this.date, this.type, this.from);

  Map<String, dynamic> toJson() => {
        'taskName': taskName,
        'date': date,
        'type': type,
        'from': from,
      };

  TaskItemModel.fromJson(Map<String, dynamic> json)
      : taskName = json['taskName'],
        date = json['date'],
        type = json['type'],
        from = json['from'];
}
