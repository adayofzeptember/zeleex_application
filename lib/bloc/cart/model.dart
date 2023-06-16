class Cart_Stores_Model {
  int? id;
  String? title;

  Cart_Stores_Model({this.id, this.title});
}

class Cart_SKU_Model {
  String? image;
  String? sku_title;
  String? name;
  String? unit;

  Cart_SKU_Model({
    this.image,
    this.sku_title,
    this.name,
    this.unit,
  });
}



// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:equatable/equatable.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:zeleex_application/Others/url.dart';
// import 'model.dart';
// part 'cart_event.dart';
// part 'cart_state.dart';

// class CartBloc extends Bloc<CartEvent, CartState> {
//   final dio = Dio();
//   CartBloc()
//       : super(CartState(cart_list: [], isLoading: false, cart_list_sku: [])) {
//     on<Load_Cart_Store>((event, emit) async {
//       emit(state.copyWith(
//         isLoading: true,
//       ));
//       SharedPreferences prefs2 = await SharedPreferences.getInstance();
//       var user_token = prefs2.get('keyToken');

//       try {
//         final response = await dio.get(
//           zeelexAPI_URL_admin + "cart/list",
//           options: Options(headers: {
//             "Content-Type": "application/json",
//             "Authorization": "Bearer $user_token",
//           }),
//         );
//         var fetched_storesInCart = [];
//         var fetched_prdSKUInStore = [];
//         if (response.data['responseStatus'].toString() == "true") {
//           emit(state.copyWith(
//             isLoading: false,
//           ));

//           for (var nestedStore in response.data['data']['store']) {
//             fetched_storesInCart.add(
//               Cart_Stores_Model(
//                 id: await nestedStore['id'],
//                 title: await nestedStore['title'],
//               ),
//             );
//           }

//           // ทำแยก event ที่ต้องการ store_index ด้วย

//           for (var i = 0; i < fetched_storesInCart.length; i++) {
//           for (var nestedSKU in response.data['data']['store'][i]
//               ['product_skus']) {
//             fetched_prdSKUInStore.add(
//               Cart_SKU_Model(
//                 sku_title: await nestedSKU['name'],
//               ),
//             );
//           }
//           }

//           emit(state.copyWith(
//             cart_list: fetched_storesInCart,
//             cart_list_sku: fetched_prdSKUInStore,
//           ));

//           // for (var i = 0; i < state.cart_list_sku.length; i++) {
//           //   print(state.cart_list_sku[i].titlex);
//           // }
//         } else {
//           emit(state.copyWith(
//             isLoading: false,
//           ));
//           print('error not 200');
//         }
//       } catch (e) {
//         emit(state.copyWith(
//           isLoading: false,
//         ));
//         print("Exception $e");
//       }
//     });

//     //*

//     // on<Load_Cart_Store_SKU>((event, emit) async {
//     //   SharedPreferences prefs2 = await SharedPreferences.getInstance();
//     //   var user_token = prefs2.get('keyToken');

//     //   try {
//     //     final response = await dio.get(
//     //       zeelexAPI_URL_admin + "cart/list",
//     //       options: Options(headers: {
//     //         "Content-Type": "application/json",
//     //         "Authorization": "Bearer $user_token",
//     //       }),
//     //     );

//     //     var fetched_prdSKUInStore = [];
//     //     if (response.data['responseStatus'].toString() == "true") {
//     //       for (var nestedSKU in response.data['data']['store']
//     //           [event.getStoreIndex]['product_skus']) {
//     //         fetched_prdSKUInStore.add(
//     //           Cart_SKU_Model(
//     //             sku_title: await nestedSKU['name'],
//     //           ),
//     //         );
//     //       }

//     //       print(fetched_prdSKUInStore.length);
//     //       emit(state.copyWith(
//     //         cart_list_sku: fetched_prdSKUInStore,
//     //       ));
//     //     } else {
//     //       print('error not 200');
//     //     }
//     //   } catch (e) {
//     //     print("Exception $e");
//     //   }
//     // });
//   }
// }
