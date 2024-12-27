class Poster {
  final String id;
  final String name;
  final String? imageUrl;

  Poster({
    required this.id,
    required this.name,
    this.imageUrl,
  });

  factory Poster.fromJson(Map<String, dynamic> json) {
    const String baseUrl = 'http://10.0.2.2:8090/api/files/';
    final String collectionId = json['collectionId'] ?? '';
    final String recordId = json['id'] ?? '';
    final String fileName = json['imageUrl'] ?? '';

    return Poster(
      id: recordId,
      name: json['posterName'] ?? '',
      imageUrl: fileName.isNotEmpty
          ? '$baseUrl$collectionId/$recordId/$fileName'
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'posterName': name,
      'imageUrl': imageUrl,
    };
  }
}
