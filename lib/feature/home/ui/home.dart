import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Home Screen",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        elevation: 4,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                context.read<HomeBloc>()
                    .add(HomeWishListButtonNavigateEvent());
              },
              icon: Icon(Icons.favorite_outline)
          ),
          IconButton(
              onPressed: (){

                context.read<HomeBloc>()
                    .add(HomeCartButtonNavigationEvent());

              },
              icon: Icon(Icons.shopping_cart_outlined)
          ),
        ],
      ),

    );
  }
}
