part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent{}

class CartRemoveFormCartEvent extends CartEvent{
  final ProductDataModel productDataModel;

  CartRemoveFormCartEvent({required this.productDataModel});

}
