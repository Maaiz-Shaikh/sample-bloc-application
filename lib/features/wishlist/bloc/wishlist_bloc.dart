import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart'; // ignore: depend_on_referenced_packages

import '../../../data/wishlist_items.dart';
import '../../home/models/product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(wishlistRemoveFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems));
  }

  FutureOr<void> wishlistRemoveFromWishlistEvent(
      WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.clickedProduct);
    event.clickedProduct.isWishlisted = false;
    emit(WishlistSuccessState(wishlistItems));
  }
}
