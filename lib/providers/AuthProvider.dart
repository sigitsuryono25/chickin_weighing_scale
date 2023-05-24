import 'package:chickin_weighing_scale/models/requests/LoginReq.dart';
import 'package:chickin_weighing_scale/models/responses/login/ResponseLogin.dart';
import 'package:chickin_weighing_scale/repositories/AuthRepo.dart';

class AuthProvider {
  final AuthRepo _authRepo;

  AuthProvider(this._authRepo);

  Future<dynamic> doAuth(LoginRequest loginRequest) async {
    var authRes = await _authRepo.doAuth(loginRequest);
    if (authRes != null) {
      return ResponseLogin.fromJson(authRes);
    }else{
      return "Terjadi error, permintaan dibatalkan";
    }
  }
}
