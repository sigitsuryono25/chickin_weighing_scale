import 'dart:io';

import 'package:chickin_weighting_scale/app/helper/logging.dart';
import 'package:path_provider/path_provider.dart';

class FileHelper {
  Future<String?> get _localPath async {
    final directory = await getExternalStorageDirectory();
    return directory?.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/log.txt");
  }

  Future<File> writeToLog(String log) async {
    final file = await _localFile;
    printDebug(message: log);
    return file.writeAsString(log);
  }
}
