class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String img;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  required this.img,

  });
  CartItem copyWith({
    String? id,
    String? title,
    int? quantity,
    double? price,
    String? img,

  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      img: img ?? this.img,

    );
  }
}
