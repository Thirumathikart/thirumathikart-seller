class ApiConstants {
<<<<<<< HEAD
  static String baseUrl = 'https://thirumathikart.nitt.edu/api/auth';
  static String login = '$baseUrl/api/user/loginCustomer';
=======
  static String orderBaseUrl = 'https://thirumathikart.nitt.edu/api/product';

  static String createProduct = '$orderBaseUrl/create_product';
  static String updateStock = '$orderBaseUrl/update_product_stock/';
  static String deleteProduct = '$orderBaseUrl/delete_product';
  static String updatePrice = '$orderBaseUrl/update_product_price';
  static String getProductPrice = '$orderBaseUrl/get_product_details';
  static String updateTitle = '$orderBaseUrl/update_product_title';
  static String updateDescription = '$orderBaseUrl/update_product_description';
>>>>>>> d64f051 (feat(addproducts): add product page)
}
