import 'dart:convert';

import 'package:http/http.dart';

class AllCategoryServices {
  Future<List<dynamic>> getAllCategory() async {
    Response response =
        await get(Uri.parse("https://fakestoreapi.com/products/categories"));
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }
}
