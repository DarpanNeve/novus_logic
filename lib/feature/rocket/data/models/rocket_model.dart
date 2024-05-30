class RocketModel {
  final String id;
  final String name;
  final String country;
  final String engineCount;
  final List<dynamic> flickrImages;

  RocketModel({
    required this.id,
    required this.name,
    required this.country,
    required this.engineCount,
    required this.flickrImages,
  });

  factory RocketModel.fromJson(Map<String, dynamic> json) {
    return RocketModel(
      id: json['id'],
      name: json['name'],
      country: json['country'],
      engineCount: json['engines']['number'].toString(),
      flickrImages: json['flickr_images'],
    );
  }
}
