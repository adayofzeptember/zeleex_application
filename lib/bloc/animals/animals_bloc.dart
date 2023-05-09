import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zeleex_application/bloc/animals/model.dart';
import '../../Others/url.dart';
import '../../Screens/animal_info.dart';
part 'animals_event.dart';
part 'animals_state.dart';

class AnimalsBloc extends Bloc<AnimalsEvent, AnimalsState> {
  final dio = Dio();

  AnimalsBloc()
      : super(AnimalsState(
          animals_data: [],
          animal_info: '',
          page: 1,
          isLoading: true,
          dataTotal: 0,
        )) {

    on<Load_AllAnimals>((event, emit) async {
      try {
        final response = await dio.get(
          zeelexAPI_URL_admin +
              "animals?page=" +
              state.page.toString() +
              '&per_page=10',
          options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
          }),
        );
        var fetched_animals_data =
            (state.animals_data != []) ? state.animals_data : [];
        if (response.data['responseStatus'].toString() == "true") {
          emit(state.copyWith(dataTotal: response.data['data']['total']));
          if (response.data['data']['total'] != fetched_animals_data.length) {
            for (var nested in response.data['data']['data']) {
              fetched_animals_data.add(
                Animals_Model(
                  id: await nested['id'],
                  title: await nested['title'],
                  price: await nested['price'].toString(),
                  image: await nested['image']['thumbnail'],
                  description: (nested['description'] == null)
                      ? "- ดูรายละเอียดเพิ่มเติม -"
                      : await nested['description'],
                ),
              );
            }

            emit(state.copyWith(
              animals_data: fetched_animals_data,
              page: state.page + 1,
              isLoading: (fetched_animals_data.length ==
                      response.data['data']['total'])
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

    on<Load_AnimalInfo>((event, emit) async {
    
      Navigator.push(
        event.context,
        PageTransition(
          duration: const Duration(milliseconds: 250),
          type: PageTransitionType.fade,
          child: Animal_Info_Page(
            animalName: event.title,
          ),
        ),
      );

      emit(state.copyWith(isLoading: true));

      try {
        final response = await dio.get(
          zeelexAPI_URL_admin + "animals/" + event.id,
          options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
          }),
        );
        List getImgs = [];
        dynamic fetched_dataInfo =
            (state.animal_info != '') ? state.animal_info : '';
        dynamic nestedData = response.data['data']['animal'];
        dynamic nestedStore = response.data['data']['animal']['store'];
        if (response.statusCode == 200) {
          emit(state.copyWith(isLoading: false));

          if (response.data['data']['animal']['images'] != []) {
            for (var element in response.data['data']['animal']['images']) {
              getImgs.add(element['thumbnail']);
            }
          }

          fetched_dataInfo = Animal_Info(
              id: await nestedData['id'],
              image: getImgs,
              //await nestedData['image']['main']
              
              description: await nestedData['description'],
              title: await nestedData['title'],
              price: await nestedData['price'],
              store_id: await nestedStore['id'].toString(),
              store_title: await nestedStore['title'],
              store_address: await nestedStore['address'],
              store_phone: await nestedStore['phone'],
              store_img: await nestedStore['image']['thumbnail']);

          emit(state.copyWith(animal_info: fetched_dataInfo));
        } else {
          emit(state.copyWith(isLoading: false));
          print('loading error');
        }
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        print("Exception: $e");
      }
    });
  }
}
