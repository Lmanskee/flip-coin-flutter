import 'package:flutter/material.dart';
import 'package:flip_coin/current_animation_manager/current_animation_manager.dart';
import 'package:flip_coin/current_animation_manager/model/current_animation.dart';

class CurrentAnimationController extends ChangeNotifier {
  CurrentAnimation? _curAnimation;

  CurrentAnimation? get curAnimation => _curAnimation;

  readCurrentAnimation() async {
    final result = await CurrentAnimationManager().readJsonFile();
    
    if (result != null) {
      _curAnimation = CurrentAnimation.fromJson(await CurrentAnimationManager().
          readJsonFile());
    }    
    
    notifyListeners();
  }

  writeCurrentAnimation(String animationAssetPath) async {
    _curAnimation = await CurrentAnimationManager().writeJsonFile(animationAssetPath);
    notifyListeners();
  }
}