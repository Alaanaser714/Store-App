import 'dart:convert';

import 'package:http/http.dart';
import 'package:store_app/models/products_model.dart';

class ProductsServices {
  Future<List<ProductsModel>> getAllProducts() async {
    Response response =
        await get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<ProductsModel> productsList = [];
      for (int i = 0; i < data.length; i++) {
        productsList.add(ProductsModel.fromJson(data[i]));
      }
      return productsList;
    } else {
      throw Exception("there was an error");
    }
  }
}
