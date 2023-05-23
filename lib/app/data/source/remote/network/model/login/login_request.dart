import 'dart:convert';

/// jsonrpc : "2.0"
/// params : {"login":"botsmartfarm@chickin.id","password":"IniContohPassword","db":"DEVELOPMENT_UPSTREAM_28_02_23"}

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    String? jsonrpc = "2.0",
    Params? params,
  }) {
    _jsonrpc = jsonrpc;
    _params = params;
  }

  LoginRequest.fromJson(dynamic json) {
    _jsonrpc = json['jsonrpc'];
    _params = json['params'] != null ? Params.fromJson(json['params']) : null;
  }

  String? _jsonrpc;
  Params? _params;

  LoginRequest copyWith({
    String? jsonrpc,
    Params? params,
  }) =>
      LoginRequest(
        jsonrpc: jsonrpc ?? _jsonrpc,
        params: params ?? _params,
      );

  String? get jsonrpc => _jsonrpc;

  Params? get params => _params;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['jsonrpc'] = _jsonrpc;
    if (_params != null) {
      map['params'] = _params?.toJson();
    }
    return map;
  }
}

/// login : "botsmartfarm@chickin.id"
/// password : "IniContohPassword"
/// db : "DEVELOPMENT_UPSTREAM_28_02_23"

Params paramsFromJson(String str) => Params.fromJson(json.decode(str));

String paramsToJson(Params data) => json.encode(data.toJson());

class Params {
  Params({
    String? login,
    String? password,
    String? db,
  }) {
    _login = login;
    _password = password;
    _db = db;
  }

  Params.fromJson(dynamic json) {
    _login = json['login'];
    _password = json['password'];
    _db = json['db'];
  }

  String? _login;
  String? _password;
  String? _db;

  Params copyWith({
    String? login,
    String? password,
    String? db,
  }) =>
      Params(
        login: login ?? _login,
        password: password ?? _password,
        db: db ?? _db,
      );

  String? get login => _login;

  String? get password => _password;

  String? get db => _db;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = _login;
    map['password'] = _password;
    map['db'] = _db;
    return map;
  }
}
