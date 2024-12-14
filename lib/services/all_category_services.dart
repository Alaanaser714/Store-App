import 'dart:convert';

import 'package:http/http.dart';

class AllCategoryServices {
  Future<List<dynamic>> getAllCategory() async {
    Response response =
        await get(Uri.parse("https://fakestoreapi.com/products/categories"));
        if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data;
     } else {
      throw Exception("there was an error");
  }}
}
