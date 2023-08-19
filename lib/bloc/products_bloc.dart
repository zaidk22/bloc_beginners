import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../models/products_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvent, ProductsState>  {
  ProductsBloc() : super(ProductsLoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      try{
        emit(ProductsLoadingState());
     var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
     if(response.statusCode==200){
       emit(ProductsLoadedState(productModelFromJson(response.body)));

     }
     else{
       throw Exception('Failed to Load product');
     }

      }
      catch(e){
        emit(ProductsErrorState(e.toString()));
      }

    });
  }
}
