class Product {
  const Product({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
  });
  final int id;
  final String imageUrl;
  final String name;
  final String description;
  final double price;
  final String color;

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['image'],
        name = json['name'],
        description = json['description'],
        price = json['price'],
        color = json['color'];

  int colorHex() {
    String hex = '0xff${color.substring(1)}';
    return int.parse(hex);
  }
}
