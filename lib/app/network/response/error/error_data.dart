class ErrorData {
  ErrorData({
      this.name, 
      this.debug, 
      this.message, 
      this.arguments, 
      this.context,});

  ErrorData.fromJson(dynamic json) {
    name = json['name'];
    debug = json['debug'];
    message = json['message'];
    arguments = json['arguments'] != null ? json['arguments'].cast<String>() : [];
    context = json['context'];
  }
  String? name;
  String? debug;
  String? message;
  List<String>? arguments;
  dynamic context;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['debug'] = debug;
    map['message'] = message;
    map['arguments'] = arguments;
    map['context'] = context;
    return map;
  }

}