import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_new/feature/home/models/home_product_data_model.dart';

import '../bloc/home_bloc.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black45
        )
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: NetworkImage(
                      productDataModel.imageUrl,
                  )
              )
            ),
          ),
          const SizedBox(height: 5,),
          Text(productDataModel.name),
          const SizedBox(height: 5,),
          Text(productDataModel.description),
          const SizedBox(height: 5,),

          Row(
            children: [
              Text("\$ "+productDataModel.price.toString(),
                style: TextStyle(
                    fontSize: 18
                ),),
                const Spacer(),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<HomeBloc>()
                            .add(HomeProductWishListButtonClickedEvent(clickedProduct: productDataModel));
                      },
                      icon: Icon(Icons.favorite_outline)),
                  IconButton(
                      onPressed: () {
                        context
                            .read<HomeBloc>()
                            .add(HomeProductCartButtonClickedEvent(productDataModel: productDataModel));
                      },
                      icon: const Icon(Icons.shopping_cart_outlined)),
                ],
              )

            ],
          )



        ],
      ),

    );
  }
}
