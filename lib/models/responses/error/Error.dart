import 'ErrorData.dart';

class Error {
  Error({
      this.code, 
      this.message, 
      this.data,});

  Error.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? ErrorData.fromJson(json['data']) : null;
  }
  int? code;
  String? message;
  ErrorData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}