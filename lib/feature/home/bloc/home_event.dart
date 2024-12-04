part of 'home_bloc.dart';


sealed class HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent{}

class HomeProductCartButtonClickedEvent extends HomeEvent{}

class HomeWishListButtonNavigateEvent extends HomeEvent{}

class HomeCartButtonNavigationEvent extends HomeEvent{}


