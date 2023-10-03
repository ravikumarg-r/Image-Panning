class UserCard {
  UserCard({
    required this.primaryColor,
    required this.profileBannerImageURL,
    required this.colorFilter,
  });
  late final String primaryColor;
  late final String profileBannerImageURL;
  late final List<dynamic> colorFilter;

  UserCard.fromJson(Map<String, dynamic> json) {
    primaryColor = json['primaryColor'];
    profileBannerImageURL = json['profileBannerImageURL'];
    colorFilter = List.castFrom<dynamic, dynamic>(json['colorFilter']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['primaryColor'] = primaryColor;
    _data['profileBannerImageURL'] = profileBannerImageURL;
    _data['colorFilter'] = colorFilter;
    return _data;
  }
}
