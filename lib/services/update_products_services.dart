import 'dart:convert';

import 'package:http/http.dart';
import 'package:store_app/models/products_model.dart';

class UpdateProductsServices {
  Future<ProductsModel> updateProducts({
    required String title,
    required String price,
    required String description,
    required String category,
    required String image,
  }) async {
    Response response =
        await post(Uri.parse("https://fakestoreapi.com/products/:id"), body: {
      "title": title,
      "price": price,
      "description": description,
      "image": category,
      "category": image,
    }, headers: {
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FuaW1hbHMuY29kZWVsbGEuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzMzNDE0ODI4LCJleHAiOjE3MzQwMTk2MjgsIm5iZiI6MTczMzQxNDgyOCwianRpIjoiVkw1bDBoRjhlQ3lYRng0WiIsInN1YiI6IjEyOCIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.5S2zu6xjiHdEBT8Gpdiid9fjm-O890wzKX9KTGQYB9c",
      "Content-Type": "application/x-www-form-urlencoded"
    });
    Map<String, String> data = jsonDecode(response.body);
    return ProductsModel.fromJson(data);
  }
}
