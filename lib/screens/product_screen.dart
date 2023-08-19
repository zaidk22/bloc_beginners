import 'package:bloc_beginner/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: BlocBuilder<ProductsBloc,ProductsState>(
        builder: (context, state) {
          if(state is ProductsLoadingState){
            return Center(child: CircularProgressIndicator());
          }
          else if(state is ProductsLoadedState){
            return ListView.builder(
              itemCount: state.productModel.length,
              itemBuilder: (context, index) {

              return ListTile(
                title: Text(state.productModel[index].title  ?? ""),
              );
            },);
          }
          else if(state is ProductsErrorState){
            return Text(state.errorMessage);
          }
          else{
            return SizedBox();
          }

        },

      )
    );
  }
}
