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
  int? id, totalAmount;
  String? customerAddress,customerAddress1,customerAddress2,customerAddress3,customerAddress4,customerAddress5,customerContact,customerpincode,sellerAddress, sellerName;
  List<OrderItemDisplay>? orderItemsList;

  OrderDisplay({
    this.id,
    this.status,
    this.totalAmount,
    this.orderItemsList,
    this.customerAddress,
    this.customerAddress1,
    this.customerAddress2,
    this.customerAddress3,
    this.customerAddress4,
    this.customerAddress5,
    this.customerpincode,
    this.sellerName,
    this.sellerAddress,
    this.customerContact,
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
