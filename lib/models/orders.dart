// class Orders {
//   String? customerName, customerContact, payment, address;
//   int? orderID;
//   double? total;
//   Orders(
//       {this.customerName,
//       this.customerContact,
//       this.payment,
//       this.address,
//       this.total,
//       this.orderID});
// }

class OrderDisplay {
  String? status;
  int? id, totalAmount, customerAddress, sellerAddress;
  List<OrderItemDisplay>? orderItemsList;

  OrderDisplay({
    this.id,
    this.status,
    this.totalAmount,
    this.orderItemsList,
    this.customerAddress,
    this.sellerAddress,
  });
}

class OrderItemDisplay {
  String? name, category, description;
  int? price, quantity, totalPrice;
  OrderItemDisplay({
    this.name,
    this.category,
    this.description,
    this.price,
    this.quantity,
    this.totalPrice,
  });
}
