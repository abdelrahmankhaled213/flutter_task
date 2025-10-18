class ProductModel {
  final int id;
  final String name;
  final String image;
  final double price;
  final double oldPrice;
  final int discount;
  final bool isFavorite;
  final bool isInCart;
  final String category;
  final String? description;

  const ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.isFavorite,
    required this.isInCart,
    required this.category,
    this.description,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
    id: map['id'],
    name: map['name'],
    image: map['image'],
    price: map['price'],
    oldPrice: map['old_price'],
    discount: map['discount'],
    isFavorite: map['is_favorite'] == 1,
    isInCart: map['is_in_cart'] == 1,
    category: map['category'],
    description: map['description'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'image': image,
    'price': price,
    'old_price': oldPrice,
    'discount': discount,
    'is_favorite': isFavorite ? 1 : 0,
    'is_in_cart': isInCart ? 1 : 0,
    'category': category,
    'description': description,
  };
}
