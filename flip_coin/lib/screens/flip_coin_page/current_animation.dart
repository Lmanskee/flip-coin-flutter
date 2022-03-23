class CurrentAnimation {
  String? currentAnimation;

  CurrentAnimation({this.currentAnimation});

  CurrentAnimation.fromJson(Map<String, dynamic> json) {
    currentAnimation = json['currentAnimation'];
  }
}
