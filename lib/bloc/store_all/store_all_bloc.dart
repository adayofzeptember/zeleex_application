import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:search_choices/search_choices.dart';
import 'package:zeleex_application/Screens/store_info.dart';
import 'package:zeleex_application/bloc/store_all/model.dart';

import '../../Others/url.dart';
part 'store_all_event.dart';
part 'store_all_state.dart';

class StoreAllBloc extends Bloc<StoreAllEvent, StoreAllState> {
  final dio = Dio();
  StoreAllBloc()
      : super(StoreAllState(
          allstores_data: [],
          store_info: '',
          page: 1,
          isLoading: true,
          dataTotal: 0,
        )) {
    on<Load_AllStores>((event, emit) async {
      try {
        final response = await dio.get(
          zeleexAPI_URl +
              "stores?page=" +
              state.page.toString() +
              '&per_page=10',
          options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
          }),
        );
        var fetched_stores_data =
            (state.allstores_data != []) ? state.allstores_data : [];
        if (response.data['responseStatus'].toString() == "true") {
          emit(state.copyWith(dataTotal: response.data['data']['total']));
          if (response.data['data']['total'] != fetched_stores_data.length) {
            for (var nested in response.data['data']['data']) {
              fetched_stores_data.add(
                AllStores_Model(
                  id: await nested['id'],
                  title: await nested['title'],
                  address: await nested['address'],
                  image: (nested['image']['thumbnail'] == "")
                      ? "https://www.freeiconspng.com/thumbs/retail-store-icon/retail-shop-icon-3.png"
                      : await nested['image']['thumbnail'],
                ),
              );
            }

            emit(state.copyWith(
              allstores_data: fetched_stores_data,
              page: state.page + 1,
              isLoading:
                  (fetched_stores_data.length == response.data['data']['total'])
                      ? false
                      : true,
            ));
          } else {
            print('all data is loaded');
          }
        } else {
          print('loading error');
        }
      } catch (e) {
        print("Exception $e");
      }
    });

    //! เข้าไปดูร้าน //*-------------------------------------

    on<Load_StoreInfo>((event, emit) async {
      Navigator.push(
        event.context,
        PageTransition(
          duration: const Duration(milliseconds: 250),
          type: PageTransitionType.fade,
          child: Store_Info(event.title),
        ),
      );

      emit(state.copyWith(isLoading: true));

      try {
        final response = await dio.get(
          zeleexAPI_URl + "stores/" + event.id,
          options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
          }),
        );
        List getTypes = [];
        dynamic fetched_dataInfo =
            (state.store_info != '') ? state.store_info : '';
        dynamic nestedData = response.data['data'];
        if (response.statusCode == 200) {
          emit(state.copyWith(isLoading: false));

          if (response.data['data']['types'] != []) {
            for (var element in response.data['data']['types']) {
              getTypes.add(element['title']);
            }
          }

          fetched_dataInfo = StoreInfo_Model(
              id: await nestedData['id'],
              title: await nestedData['title'],
              phone: await nestedData['phone'],
              content: await nestedData['content'],
              address: await nestedData['address'],
              image: await nestedData['image']['main'],
              types: getTypes);

          emit(state.copyWith(store_info: fetched_dataInfo));
        } else {
          emit(state.copyWith(isLoading: false));
          print('loading error');
        }
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        print("Exception $e");
      }
    });
  }
}
