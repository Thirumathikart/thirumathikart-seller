class ProductTwo {
  final String? image, name, parentName, details;
  int? id, parentId, quantity = 0;
  final double? price;
  // ignore: prefer_typing_uninitialized_variables
  var weight;
  ProductTwo({
    this.id,
    this.name,
    this.image,
    this.price,
    this.weight,
    this.parentId,
    this.parentName,
    this.details,
    this.quantity,
  });
}
