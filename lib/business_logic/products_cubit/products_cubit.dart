import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/products/products.dart';

import '../../data/network/responses/products_response.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductState> {
  ProductsCubit() : super(ProductInitial());
  List<Products> allProducts = [];
  List<Products> categoryProducts = [];
  String mainImage = "";
  bool isFavourite = false;
  Future getProduct() async {
    emit(ProductLoading());
    try {
      var response = await DioHelper.getData(
          url: 'http://192.168.100.3:3000/products', query: {});
      //  print(response.data['data'][2]);
      ProductsResponse productResponse =
          ProductsResponse.fromJson(response.data);
      allProducts = [...?productResponse.data];
      emit(ProductSucces());
    } on DioError catch (e) {
      print("Error from getProduct $e");
      print("Error msg ${e.message}");
      emit(ProductFailed());
    }
  }

  List<Products> changeCategoryPage(int index) {
    if (index == 0) {
      return allProducts;
    } else if (index == 1) {
      return allProducts.where((element) => element.brand == "Acer").toList();
    } else {
      return allProducts.where((element) => element.brand == "Razer").toList();
    }
  }

  changeMainImage({required String image}) {
    mainImage = image;
    emit(ProductMainImageChanged());
  }

  String setMainImage(Products product) {
    return mainImage = product.images![0];
  }

  List<Products>? searchProduct(String keyword) {
    return allProducts
        .where((element) =>
            element.model!.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}
