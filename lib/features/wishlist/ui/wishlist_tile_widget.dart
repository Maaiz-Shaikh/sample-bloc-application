import 'package:flutter/material.dart';
import 'package:sample_bloc_application/features/wishlist/bloc/wishlist_bloc.dart';

import '../../home/models/product_data_model.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel wishlistItem;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget(
      {super.key, required this.wishlistItem, required this.wishlistBloc});

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
                      wishlistItem.imageUrl,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Text(
                  wishlistItem.name,
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
                '\$${wishlistItem.price}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      wishlistBloc
                          .add(WishlistRemoveFromWishlistEvent(wishlistItem));
                    },
                    icon: const Icon(
                      Icons.favorite,
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
