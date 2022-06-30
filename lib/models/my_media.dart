class MyMedia {
  int? id;
  String? title;
  String? videoUrl;
  String? coverPicture;

  MyMedia({this.id, this.title, this.videoUrl, this.coverPicture});

  MyMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    videoUrl = json['videoUrl'];
    coverPicture = json['coverPicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['videoUrl'] = videoUrl;
    data['coverPicture'] = coverPicture;
    return data;
  }
}
