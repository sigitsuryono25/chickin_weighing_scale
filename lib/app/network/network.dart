import 'dart:convert';

import 'package:chickin_weighting_scale/app/database/model/barang_masuk.dart';
import 'package:http/http.dart' as http;

class NetworkUtil {
  static const BASEURL = "";

  Future<http.Response> sendDataIntoOdoo(BarangMasukEntity barangMasukEntity) {
    return http.post(Uri.parse(BASEURL),
        headers: _jsonHeaders, body: jsonEncode(barangMasukEntity.toJson()));
  }

  static const _jsonHeaders = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8'
  };
}
