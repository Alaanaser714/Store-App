// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/screens/update_products_screen.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.productsModel,
  });

  ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) {
                  return UpdateProductsScreen();
                },
                settings: RouteSettings(
                  arguments: productsModel,
                )));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.10),
                blurRadius: 10,
                offset: const Offset(10, 5),
              )
            ]),
            width: 180,
            height: 140,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      productsModel.title.substring(0, 7),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${productsModel.price.toString()}',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -50,
            left: 35,
            child: Image.network(
              productsModel.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
