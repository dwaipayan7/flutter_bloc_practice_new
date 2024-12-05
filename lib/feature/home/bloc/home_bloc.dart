import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice_new/data/grocery_data.dart';

import '../models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeCartButtonNavigationEvent>(homeCartButtonNavigationEvent);
    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedState(
      products: GroceryData.groceryProducts.map(
        (e) => ProductDataModel(
          id: e['id'],
          name: e['name'],
          description: e['description'],
          price: e['price'],
          imageUrl: e['imageUrl'],
        ),
      ).toList()
    ));
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist Product clicked");
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Product clicked');
  }

  FutureOr<void> homeCartButtonNavigationEvent(
      HomeCartButtonNavigationEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
    print("Cart Navigate Clicked");
  }

  FutureOr<void> homeWishListButtonNavigateEvent(
      HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishListPageActionState());

    print("wishlist navigate clicked");
  }
}
