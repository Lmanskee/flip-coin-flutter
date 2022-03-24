import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flip_coin/model/current_animation.dart';

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
    String fileContent = 'assets/coinflip-default.riv';

    File file = await _jsonFile;

    if (await file.exists()) {
      try {
        fileContent = await file.readAsString();
        return json.decode(fileContent);
      } catch (e) {
        print(e); 
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

