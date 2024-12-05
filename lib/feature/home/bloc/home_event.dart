part of 'home_bloc.dart';


sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishListButtonClickedEvent extends HomeEvent{
  final ProductDataModel clickedProduct;

  HomeProductWishListButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent{
  final ProductDataModel productDataModel;

  HomeProductCartButtonClickedEvent({required this.productDataModel});
}

class HomeWishListButtonNavigateEvent extends HomeEvent{}

class HomeCartButtonNavigationEvent extends HomeEvent{}


