class FoodItem {
  final String name;
  final String? specialty;
  final String category;
  final double price;
  final double discount;
  final String sellarname;
  final String sellaraddress;
  final String image;

  FoodItem({
    required this.name,
    this.specialty,
    required this.category,
    required this.price,
    required this.discount,
    required this.sellarname,
    required this.sellaraddress,
    required this.image,
  });

  // Factory method to create a FoodItem from JSON
  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      name: json['name'],
      specialty: json['specialty'],
      category: json['category'],
      price: json['price'].toDouble(),
      discount: json['discount'].toDouble(),
      sellarname: json['sellarname'],
      sellaraddress: json['sellaraddress'],
      image: json['image'],
    );
  }

  // Method to convert a FoodItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialty': specialty,
      'category': category,
      'price': price,
      'discount': discount,
      'sellarname': sellarname,
      'sellaraddress': sellaraddress,
      'image': image,
    };
  }
}