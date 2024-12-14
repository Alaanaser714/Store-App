import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';

import '../services/get_all_products_services.dart';
import '../widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "New Trend",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.category,
              color: Colors.grey,
              size: 35,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          right: 10,
          left: 10,
        ),
        child: FutureBuilder<List<ProductsModel>>(
          future: ProductsServices().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              } else if (snapshot.hasData && snapshot.data != null) {
                List<ProductsModel> productsList = snapshot.data!;
                return GridView.builder(
                  itemCount: productsList.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(
                      productsModel: productsList[index],
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("No products found"),
                );
              }
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
