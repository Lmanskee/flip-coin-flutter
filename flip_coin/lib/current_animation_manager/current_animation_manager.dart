import 'dart:convert';
import 'dart:io';

import 'package:flip_coin/current_animation_manager/model/current_animation.dart';

import 'package:path_provider/path_provider.dart';

class CurrentAnimationManager {
  Future<String> get _directoryPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }  

  Future<File> get _jsonFile async {
    final path = await _directoryPath;
    return File('$path/current_animation.json');
  }

  Future readJsonFile() async {
    String fileContent = 'assets/rivs/default-coin-animation.riv';

    File file = await _jsonFile;

    if (await file.exists()) {
      try {
        fileContent = await file.readAsString();
        return json.decode(fileContent);
      } catch (e) {
        return null;
      }
    }

  }

  Future<CurrentAnimation> writeJsonFile(String data) async {
    final CurrentAnimation curAnimation = CurrentAnimation(data);

    File file = await _jsonFile;
    await file.writeAsString(json.encode(curAnimation));

    return curAnimation;
  }
}

