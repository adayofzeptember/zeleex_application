import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zeleex_application/Others/url.dart';
import 'package:zeleex_application/Screens/product_info.dart';
import 'package:zeleex_application/bloc/products/model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final dio = Dio();
  ProductsBloc()
      : super(ProductsState(
          show_price: '',
          product_skus: [],
          product_info: '',
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
            print('all products is loaded');
          }
        } else {
          print('loading error');
        }
      } catch (e) {
        print("Exception $e");
      }
    });

    //!

    on<Load_ProductInfo>((event, emit) async {
      Navigator.push(
        event.context,
        PageTransition(
          duration: const Duration(milliseconds: 250),
          type: PageTransitionType.fade,
          child: Product_Info_Page(
            productName: event.title,
          ),
        ),
      );

      emit(state.copyWith(isLoading: true));

      try {
        final response = await dio.get(
          zeelexAPI_URL_admin + "products/" + event.id,
          options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
          }),
        );

        dynamic fetched_dataInfo =
            (state.product_info != '') ? state.product_info : '';
        dynamic nestedData = response.data['data']['product'];
        dynamic nestedStore = response.data['data']['product']['store'];
        var fetched_sku = (state.product_skus != []) ? state.product_skus : [];
        if (response.statusCode == 200) {
          emit(state.copyWith(isLoading: false));

          fetched_dataInfo = Product_Info(
              id: await nestedData['id'].toString(),
              images: await nestedData['image']['main'],
              title: await nestedData['title'],
              price: await nestedData['price'].toString(),
              store_description: await nestedStore['content'],
              store_id: await nestedStore['id'].toString(),
              store_title: await nestedStore['title'].toString(),
              store_address: await nestedStore['address'].toString(),
              store_phone: await nestedStore['phone'].toString(),
              store_img: (nestedStore['image']['thumbnail'].toString() == "")
                  ? 'https://api.zeleex.com/file/534/634e1e245a5d9_275773114_2754272138202414_4661250318203734812_n.jpg'
                  : await nestedStore['image']['thumbnail'].toString());

          emit(state.copyWith(product_info: fetched_dataInfo));

          for (var nestedSKUS in response.data['data']['product']['skus']) {
            fetched_sku.add(
              Product_Skus_List(
                sku_id: await nestedSKUS['id'].toString(),
                sku_name: await nestedSKUS['name'].toString(),
                sku_price: await nestedSKUS['price'].toString(),
                sku_stock: await nestedSKUS['stock'].toString(),
              ),
            );
          }
          emit(state.copyWith(product_skus: fetched_sku));
        } else {
          emit(state.copyWith(isLoading: false));
          print('loading error');
        }
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        print("Exception: $e");
      }
    });

    on<Clear_Sku>((event, emit) {
      emit(state.copyWith(product_skus: [], show_price: ''));
    });

    on<Show_SKUPrice>(
      (event, emit) {
        print(event.thePrice);

        emit(state.copyWith(show_price: '฿ ${event.thePrice}'));
      },
    );

    // on<Load_SKUS>((event, emit) async {
    //   try {
    //     final response = await dio.get(
    //       zeelexAPI_URL_admin + "products/" + event.id,
    //       options: Options(headers: {
    //         "Content-Type": "application/json",
    //         // "Authorization": "Bearer $token",
    //       }),
    //     );
    //     var fetched_sku = (state.product_skus != []) ? state.product_skus : [];
    //     if (response.statusCode == 200) {
    //       for (var nestedSKUS in response.data['data']['product']['skus']) {
    //         fetched_sku.add(
    //           Product_Skus_List(
    //             sku_id: await nestedSKUS['id'].toString(),
    //             sku_name: await nestedSKUS['name'].toString(),
    //             sku_price: await nestedSKUS['price'].toString(),
    //             sku_stock: await nestedSKUS['stock'].toString(),
    //           ),
    //         );
    //       }

    //       emit(state.copyWith(product_skus: fetched_sku));
    //     } else {
    //       emit(state.copyWith(isLoading: false));
    //       print('loading error');
    //     }
    //   } catch (e) {
    //     emit(state.copyWith(isLoading: false));
    //     print("Exception: $e");
    //   }
    // });
  }
}
