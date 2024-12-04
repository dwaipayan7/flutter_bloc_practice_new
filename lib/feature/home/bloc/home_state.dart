part of 'home_bloc.dart';


sealed class HomeState {}

abstract class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}


class HomeLoadedSuccessState extends HomeState{}

class HomeLoadingState extends HomeState{}

class HomeLoadedState extends HomeState{}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishListPageActionState extends HomeActionState{}

class HomeNavigateToCartPageActionState extends HomeActionState{}