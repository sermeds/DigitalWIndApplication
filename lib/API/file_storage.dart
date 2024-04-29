import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class SingleValueFileStorage<T> {
  SingleValueFileStorage(String filename) {
    _file = _localPath.then((path) => File('$path/$filename'));
  }

  late final Future<File> _file;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<T> readValue() async {
      final file = await _file;

      String json = await file.readAsString();

      return jsonDecode(json) as T;
  }

  Future writeValue(T value) async {
    final file = await _file;

    String json = jsonEncode(value);

    file.writeAsString(json);
  }
}
