import 'dart:async';

import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductWishListButtonClickedEvent>(homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeCartButtonNavigationEvent>(homeCartButtonNavigationEvent);
    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {

    print("Wishlist Product clicked");
  }


  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {

    print('Cart Product clicked');
  }

  FutureOr<void> homeCartButtonNavigationEvent(HomeCartButtonNavigationEvent event, Emitter<HomeState> emit) {

    print("Cart Navigate Clicked");

  }

  FutureOr<void> homeWishListButtonNavigateEvent(HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {

    print("wishlist navigate clicked");

  }
}
