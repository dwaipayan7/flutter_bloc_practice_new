import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/bloc/home_bloc.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

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
              onPressed: (){},
              icon: Icon(Icons.favorite_outline)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.shopping_cart_outlined)
          ),
        ],
      ),

      body: BlocConsumer<HomeBloc, HomeState>(

        // listenWhen: (previous,current){},
        // buildWhen: (previous, current){},

        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}
