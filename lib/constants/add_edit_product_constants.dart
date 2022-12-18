class EditProductConstants {
  static const String name = 'Name';
  static const String price = 'Price';
  static const String category = 'Category';
  static const String description = 'Description';
  static const String quantity = 'Quantity';
  static const List<String> categoryItems = <String>[
    'Food',
    'Clothing',
    'Handricrafts',
    'Grocery',
    'Fahion and Jewellery',
    'Beauty and Healthcare',
    'Office Code',
    'Organic Fruits & Vegetables',
    'Others'
  ];
  static var categoryMap = {
    'Food': 1,
    'Clothing': 2,
    'Handricrafts': 3,
    'Grocery': 4,
    'Fahion and Jewellery': 5,
    'Beauty and Healthcare': 6,
    'Office Code': 7,
    'Organic Fruits & Vegetables': 8,
    'Others': 9
  };
}
