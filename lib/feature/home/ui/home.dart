import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_new/feature/cart/ui/cart.dart';
import 'package:flutter_bloc_practice_new/feature/home/ui/product_tile_widget.dart';
import 'package:flutter_bloc_practice_new/feature/wishlist/ui/wishlist.dart';

import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Wishlist()));
        }
      },
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        if (state is HomeLoadedState) {
          final successState = state as HomeLoadedState;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text(
                "Home Screen",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              elevation: 4,
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(HomeWishListButtonNavigateEvent());
                    },
                    icon: Icon(Icons.favorite_outline)),
                IconButton(
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(HomeCartButtonNavigationEvent());
                    },
                    icon: const Icon(Icons.shopping_cart_outlined)),
              ],
            ),
            body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    productDataModel: successState.products[index],
                  );
                }),
          );
        }

        if (state is HomeErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Getting error")),
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
