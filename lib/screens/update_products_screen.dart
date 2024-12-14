import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/update_products_services.dart';

import '../widgets/cutom_button.dart';
import '../widgets/cutom_text_field.dart';

class UpdateProductsScreen extends StatefulWidget {
  UpdateProductsScreen({
    super.key,
  });

  @override
  State<UpdateProductsScreen> createState() => _UpdateProductsScreenState();
}

class _UpdateProductsScreenState extends State<UpdateProductsScreen> {
  String? productName, desc, image, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductsModel product =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Update Products",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                CustomTextField(
                  onChanged: (data) {
                    price = data;
                  },
                  keyboardType: TextInputType.number,
                  hintText: 'Price',
                ),
                CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'Descrebtion',
                ),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'Image',
                ),
                CustomButton(
                  title: 'Update',
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });

                    try {
                      await UpdateProductsServices().updateProducts(
                        title:
                            productName == null ? product.title : productName!,
                        price:
                            price == null ? product.price.toString() : price!,
                        description: desc == null ? product.description : desc!,
                        category: product.category,
                        image: image == null ? product.image : image!,
                        id: product.id,
                      );
                      print("=============");
                    } catch (e) {
                      print(e.toString());
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
