import 'dart:developer';


class MenuItem {
  final String id;
  final String name;
  final String description;
  final int price;
  final String? categoryName; // Made nullable
  final String? imageUrl;

  MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.categoryName,
    this.imageUrl,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    // Log the raw JSON for debugging
    log('Parsing MenuItem JSON: $json');

    const String baseUrl = 'http://10.0.2.2:8090/api/files/';
    final String fileName = json['image_url'] ?? '';
    final String collectionId = json['collectionId'] ?? '';
    final String recordId = json['id'] ?? '';

    // Handle potentially null values
    return MenuItem(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      price: json['price'] ?? 0,
      categoryName: json['category_name']?.toString(), // Make this nullable

      imageUrl: fileName.isNotEmpty
          ? '$baseUrl$collectionId/$recordId/$fileName'
          : null,
    );
  }

  @override
  String toString() {
    return 'MenuItem(id: $id, name: $name, categoryName: $categoryName})';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category_name': categoryName,
      'image_url': imageUrl,
    };
  }
}
