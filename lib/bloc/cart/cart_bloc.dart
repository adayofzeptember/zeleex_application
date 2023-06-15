import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/Others/url.dart';

import 'model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final dio = Dio();
  CartBloc() : super(CartState(cart_list: [], isLoading: false)) {
    on<Load_Cart_Store>((event, emit) async {
      SharedPreferences prefs2 = await SharedPreferences.getInstance();
      var user_token = prefs2.get('keyToken');

      try {
        final response = await dio.get(
          zeelexAPI_URL_admin + "cart/list",
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $user_token",
          }),
        );
        var fetched_storesInCart = (state.cart_list != []) ? state.cart_list : [];
        if (response.data['responseStatus'].toString() == "true") {

          for (var nestedStore in response.data['data']['store']) {
            fetched_storesInCart.add(
              Cart_Stores_Model(
                id: await nestedStore['id'],
                title: await nestedStore['title'],
              ),
            );
          }
          print(fetched_storesInCart.length);
          emit(state.copyWith(
            cart_list: fetched_storesInCart,
          ));
        } else {
          print('error not 200');
        }
      } catch (e) {
        print("Exception $e");
      }
    });
  }
}
