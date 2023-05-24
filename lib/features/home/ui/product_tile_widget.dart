import 'package:flutter/material.dart';
import 'package:sample_bloc_application/features/home/bloc/home_bloc.dart';

import '../models/product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      productDataModel.imageUrl,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Text(
                  productDataModel.name,
                  style: const TextStyle(
                      fontSize: 25,
                      backgroundColor: Colors.black54,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '\$${productDataModel.price}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishlistButtonClickedEvent(
                          productDataModel));
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                          HomeProductCartButtonClickedEvent(productDataModel));
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.red,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
