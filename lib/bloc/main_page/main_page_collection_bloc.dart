import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/Others/url.dart';
import 'package:zeleex_application/bloc/main_page/model.dart';
part 'main_page_collection_event.dart';
part 'main_page_collection_state.dart';

class MainPageCollectionBloc
    extends Bloc<MainPageCollectionEvent, MainPageCollectionState> {
  final dio = Dio();
  MainPageCollectionBloc()
      : super(MainPageCollectionState(
        slider_index: 0,
            slider_pics: [],
            search_keyWords: [],
            collection_board: [],
            animals_catalog: [],
            products_catalog: [])) {
    //!
    on<Load_SliderPics>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('keyToken');
      try {
        final response = await dio.get(
          zeelexAPI_URL_admin + 'sliders',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }),
        );

        var fetched_pics = (state.slider_pics != []) ? state.slider_pics : [];
        if (response.statusCode == 200) {
          for (var nested in response.data['data']) {
            fetched_pics.add(
              Slider_Pics(
                id: await nested['id'].toString(),
                link: await nested['link'].toString(),
                pic_url: await nested['image']['main'].toString(),
              ),
            );
          }

          emit(state.copyWith(
            slider_pics: fetched_pics,
          ));
        } else {
          print('api response error');
        }
      } catch (e) {
        print("*** failed try: $e");
      }
    });

     on<IndexSlider>((event, emit) {
      emit(state.copyWith(slider_index: event.index));
   
    });

    //!

    on<Load_ColectionBoard>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('keyToken');
      try {
        final response = await dio.get(
          zeelexAPI_URL_admin + 'collection-boards',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }),
        );

        var fetched_collection =
            (state.collection_board != []) ? state.collection_board : [];
        if (response.statusCode == 200) {
          for (var nested in response.data['data']) {
            fetched_collection.add(
              Collection_Board(
                id: await nested['id'].toString(),
                title: await nested['title'].toString(),
                image: await nested['image']['main'].toString(),
              ),
            );
          }

          emit(state.copyWith(
            collection_board: fetched_collection,
          ));
        } else {
          print('api response error');
        }
      } catch (e) {
        print("*** failed try: $e");
      }
    });

    //!

    on<Load_Catalog>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('keyToken');
      try {
        final response = await dio.get(
          zeelexAPI_URL_admin + 'home',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }),
        );

        var fetched_prdCat =
            (state.products_catalog != []) ? state.products_catalog : [];

        var fetched_anmCat =
            (state.animals_catalog != []) ? state.animals_catalog : [];
        if (response.statusCode == 200) {
          for (var nested in response.data['data']['animal_cat_01']) {
            fetched_anmCat.add(
              Animals_Catalog(
                id: await nested['id'].toString(),
                title: await nested['title'].toString(),
                image: await nested['image']['thumbnail'].toString(),
                price: await nested['price'].toString(),
              ),
            );
          }

          for (var nested in response.data['data']['product_cat_01']) {
            fetched_prdCat.add(
              Products_Catalog(
                id: await nested['id'].toString(),
                title: await nested['title'].toString(),
                image: await nested['image']['thumbnail'].toString(),
                price: await nested['price'].toString(),
              ),
            );
          }

          emit(state.copyWith(
              animals_catalog: fetched_anmCat,
              products_catalog: fetched_prdCat));
        } else {
          print('api response error');
        }
      } catch (e) {
        print("*** failed try: $e");
      }
    });

    //!

    on<Get_SearchKeyWords>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('keyToken');
      try {
        final response = await dio.get(
          zeelexAPI_URL_admin + 'home',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }),
        );

        var fetched_prdCat =
            (state.products_catalog != []) ? state.products_catalog : [];

        var fetched_anmCat =
            (state.animals_catalog != []) ? state.animals_catalog : [];
        if (response.statusCode == 200) {
          for (var nested in response.data['data']['animal_cat_01']) {
            fetched_anmCat.add(
              Animals_Catalog(
                id: await nested['id'].toString(),
                title: await nested['title'].toString(),
                image: await nested['image']['thumbnail'].toString(),
                price: await nested['price'].toString(),
              ),
            );
          }

          for (var nested in response.data['data']['product_cat_01']) {
            fetched_prdCat.add(
              Products_Catalog(
                id: await nested['id'].toString(),
                title: await nested['title'].toString(),
                image: await nested['image']['thumbnail'].toString(),
                price: await nested['price'].toString(),
              ),
            );
          }

          emit(state.copyWith(
              animals_catalog: fetched_anmCat,
              products_catalog: fetched_prdCat));
        } else {
          print('api response error');
        }
      } catch (e) {
        print("*** failed try: $e");
      }
    });
  }
}
