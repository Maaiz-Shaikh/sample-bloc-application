import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart'; // ignore: depend_on_referenced_packages

import '../../../data/cart_items.dart';
import '../../../data/grocery_data.dart';
import '../models/product_data_model.dart';
import '../../../data/wishlist_items.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeLoadedSuccessState(
        productDataModel: GroceryData.groceries
            .map((e) => ProductDataModel(
                id: e['id'],
                imageUrl: e['imageUrl'],
                price: e['price'],
                description: e['description'],
                name: e['name']))
            .toList()));
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    if (event.clickedProduct.isWishlisted == false) {
      wishlistItems.add(event.clickedProduct);
      event.clickedProduct.isWishlisted = true;
      emit(HomeProductItemWishlistedActionState());
    }
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    if (event.clickedProduct.isCarted == false) {
      cartItems.add(event.clickedProduct);
      event.clickedProduct.isCarted = true;
      emit(HomeProductItemCartedActionState());
    }
  }
}
