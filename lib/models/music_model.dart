class MusicModel {
  MusicModel({this.name, this.url, this.duration, this.artist, this.type});

  String? name;
  String? url;
  String? artist;
  Duration? duration;
  String? type;

  factory MusicModel.fromJson(Map<String, dynamic> json) => MusicModel(
        name: json['name'],
        url: json['url'],
        duration: json['duration'],
        artist: json['artist'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "url": url,
      "duration": duration,
      "artist": artist,
      "type": type,
    };
  }
}
