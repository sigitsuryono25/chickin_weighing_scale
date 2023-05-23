import 'Result.dart';
import '../error/error.dart';

class ResponseLogin {
  ResponseLogin({
      this.jsonrpc, 
      this.id, 
      this.result, 
      this.error,});

  ResponseLogin.fromJson(dynamic json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }
  String? jsonrpc;
  dynamic id;
  Result? result;
  Error? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['jsonrpc'] = jsonrpc;
    map['id'] = id;
    if (result != null) {
      map['result'] = result?.toJson();
    }
    if (error != null) {
      map['error'] = error?.toJson();
    }
    return map;
  }

}