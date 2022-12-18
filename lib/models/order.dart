class Order {
  final String? image, name, status;
  int? id, quantity = 0;
  final double? price;
  String? pickup;
  Order({
    this.id,
    this.name,
    this.image,
    this.price,
    this.status,
    this.quantity,
    this.pickup,
  });
}
