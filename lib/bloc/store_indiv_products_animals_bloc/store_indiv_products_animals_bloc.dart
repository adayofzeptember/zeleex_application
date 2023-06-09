// ignore_for_file: await_only_futures

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:zeleex_application/Others/url.dart';
import 'package:zeleex_application/bloc/animals/model.dart';
import 'package:zeleex_application/bloc/products/model.dart';

part 'store_indiv_products_animals_event.dart';
part 'store_indiv_products_animals_state.dart';

class StoreIndivProductsAnimalsBloc extends Bloc<StoreIndivProductsAnimalsEvent,
    StoreIndivProductsAnimalsState> {
  final dio = Dio();
  StoreIndivProductsAnimalsBloc()
      : super(StoreIndivProductsAnimalsState(
            loading: false,
            products_inStore: [],
            count_Check: '',
            checkPrdORAnm: 'product')) {
    //*
    on<Load_ProductsInStore>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final response = await dio.get(
          zeelexAPI_URL_admin + "products?store_id=" + event.getStoreID,
          options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
          }),
        );
        var fetched_products =
            (state.products_inStore != []) ? state.products_inStore : [];
        if (response.data['responseStatus'].toString() == "true") {
          print('สินค้าในร้าน: ' + response.data['data']['total'].toString());
          emit(state.copyWith(loading: false));
          if (response.data['data']['total'] == 0) {
            emit(state.copyWith(count_Check: 'ไม่มีสินค้าในร้าน'));
          }

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
              products_inStore: fetched_products,
            ));
          } else {
            // print('all products is loaded');
          }
        } else {
          emit(state.copyWith(loading: false));
          print('loading error');
        }
      } catch (e) {
        print("Exception $e");
      }
    });
    //*------------------------------------------------------------------
    on<Load_AnimalsInStore>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final responseAnimals = await dio.get(
          zeelexAPI_URL_admin +
              "animals?per_page=10&store_id=" +
              event.getStoreID,
          options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
          }),
        );
        var fetched_animals =
            (state.products_inStore != []) ? state.products_inStore : [];
        if (responseAnimals.data['responseStatus'].toString() == "true") {
          print('สัตว์ในร้าน: ' +
              responseAnimals.data['data']['total'].toString());
          emit(state.copyWith(loading: false));
          if (responseAnimals.data['data']['total'] == 0) {
            emit(state.copyWith(count_Check: 'ไม่มีสัตว์ในร้าน'));
          }
          if (responseAnimals.data['data']['total'] != fetched_animals.length) {
            for (var nested in responseAnimals.data['data']['data']) {
              fetched_animals.add(
                Animals_Model(
                  id: await nested['id'],
                  title: await nested['title'],
                  price: await nested['price'].toString(),
                  image: await nested['image']['thumbnail'],
                ),
              );
            }
            print(fetched_animals.length);
            emit(state.copyWith(
              products_inStore: fetched_animals,
            ));
          } else {
            // print('all products is loaded');
          }
        } else {
          emit(state.copyWith(loading: false));
          print('loading error');
        }
      } catch (e) {
        emit(state.copyWith(loading: false));
        print("Exception $e");
      }
    });

    on<ClearList>((event, emit) {
      emit(state.copyWith(products_inStore: []));
    });

    on<ChangePrdANDAnm>((event, emit) {
      emit(state.copyWith(checkPrdORAnm: event.getString, products_inStore: []));
      print(state.checkPrdORAnm);
    });
  }
}
