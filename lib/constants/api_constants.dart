class ApiConstants {
  static String baseUrl = 'https://thirumathikart.nitt.edu/api/auth';
  static String login = '$baseUrl/api/user/loginCustomer';
  static String orderBaseUrl = 'https://thirumathikart.nitt.edu/api/product';
  static String orderUrl = 'https://thirumathikart.nitt.edu/api/order';

  static String createProduct = '$orderBaseUrl/create_product';
  static String updateStock = '$orderBaseUrl/update_product_stock/';
  static String deleteProduct = '$orderBaseUrl/delete_product';
  static String updatePrice = '$orderBaseUrl/update_product_price';
  static String getProductPrice = '$orderBaseUrl/get_product_details';
  static String updateTitle = '$orderBaseUrl/update_product_title';
  static String updateDescription = '$orderBaseUrl/update_product_description';
  static String updateProduct = '$orderBaseUrl/update_product';
  static String sellerProducts = '$orderBaseUrl/get_seller_product';
  static String acceptOrder = '$orderUrl/accept_order';

}
