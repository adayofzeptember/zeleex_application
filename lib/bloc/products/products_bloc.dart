import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:zeleex_application/Others/url.dart';
import 'package:zeleex_application/bloc/products/model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final dio = Dio();
  ProductsBloc()
      : super(ProductsState(
          product_list: [],
          page: 1,
          isLoading: true,
          dataTotal: 0,
        )) {
    on<Load_AllProdutcs>((event, emit) async {
      try {
        final response = await dio.get(
          zeelexAPI_URL_admin +
              "products?page=" +
              state.page.toString() +
              '&per_page=10',
          options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
          }),
        );
        var fetched_products =
            (state.product_list != []) ? state.product_list : [];
        if (response.data['responseStatus'].toString() == "true") {
          emit(state.copyWith(dataTotal: response.data['data']['total']));
          if (response.data['data']['total'] != fetched_products.length) {
            for (var nested in response.data['data']['data']) {
              fetched_products.add(
                Products_Model(
                  id: await nested['id'],
                  title: await nested['title'],
                  price: await nested['skus_min_price'].toString(),
                  image: await nested['image']['thumbnail'],
                ),
              );
            }

            emit(state.copyWith(
              product_list: fetched_products,
              page: state.page + 1,
              isLoading:
                  (fetched_products.length == response.data['data']['total'])
                      ? false
                      : true,
            ));
          } else {
            // emit(state.copyWith(isLoading: false));
            // print(state.isLoading.toString());
            print('all data is loaded');
          }
        } else {
          print('loading error');
        }
      } catch (e) {
        print("Exception $e");
      }
    });
  }
}
