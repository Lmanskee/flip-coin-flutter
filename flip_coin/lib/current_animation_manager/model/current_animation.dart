class CurrentAnimation {
  final String currentAnimation;

  CurrentAnimation(this.currentAnimation);

  CurrentAnimation.fromJson(Map<String, dynamic> json)
    : currentAnimation = json['currentAnimation'];

  Map<String, dynamic> toJson() => {
    'currentAnimation': currentAnimation
  };
}