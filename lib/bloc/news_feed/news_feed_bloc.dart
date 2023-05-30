import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zeleex_application/Screens/Main%20Sixx%20Pages/info%20of%20sixx%20pages/newsfeed_detail.dart';
import '../../Others/url.dart';
import 'model.dart';
part 'news_feed_event.dart';
part 'news_feed_state.dart';

class NewsFeedBloc extends Bloc<NewsFeedEvent, NewsFeedState> {
  final dio = Dio();
  NewsFeedBloc()
      : super(NewsFeedState(
            news_info: '',
            newsfeed_data: [],
            page: 1,
            isLoading: true,
            dataTotal: 0,
            isAllDataLoaded: false
            
            )) {
    on<Load_NewsFeed>((event, emit) async {
      try {
        final response = await dio.get(
          zeelexAPI_URL_admin + "blogs?page=" + state.page.toString() + '&per_page=5',
          options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
          }),
        );
        var fetched_data =
            (state.newsfeed_data != []) ? state.newsfeed_data : [];
        if (response.data['responseStatus'].toString() == "true") {
          emit(state.copyWith(dataTotal: response.data['data']['total']));
          if (response.data['data']['total'] != fetched_data.length) {
            for (var nested in response.data['data']['data']) {
              fetched_data.add(
                Newfeeds_Model(
                  id: await nested['id'],
                  title: await nested['title'],
                  description: (nested['description'] == null)
                      ? "ดูเพิ่มเติม"
                      : await nested['description'],
                 dateCreated: nested['created_at'],
                  image: await nested['image']['main'],
                ),
              );
            }
            emit(state.copyWith(
              newsfeed_data: fetched_data,
              page: state.page + 1,
              isLoading: (fetched_data.length == response.data['data']['total'])
                  ? false
                  : true,
            ));
          } else {
            emit(state.copyWith(isAllDataLoaded: true));
            print('all data is loaded');
          }
        } else {
          print('loading error');
        }
      } catch (e) {
        print("Exception $e");
      }
    });

//! เข้าไปดูบล็อค **--**/-/-

    on<Blog_Detail>((event, emit) async {
      Navigator.push(
        event.context,
        PageTransition(
          duration: const Duration(milliseconds: 250),
          type: PageTransitionType.fade,
          child: const NewsFeedPage_Detail(),
        ),
      );

      emit(state.copyWith(isLoading: true));
      print('blog id: ' + event.id);
      try {
        final response = await dio.get(
          zeelexAPI_URL_admin + "blogs/" + event.id,
          options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
          }),
        );
        dynamic fetched_dataInfo =
            (state.news_info != '') ? state.news_info : '';
        dynamic nestedData = response.data['data']['blog'];
        if (response.statusCode == 200) {
          emit(state.copyWith(isLoading: false));
          fetched_dataInfo = Blog_Info_Model(
            id: await nestedData['id'],
            title: await nestedData['title'],
            description: await nestedData['description'],
            content: await nestedData['content'],
            dateCreated: await nestedData['created_at'],
            seoTitle: await nestedData['seoTitle'],
            reads: await nestedData['reads'],
            seoDescription: await nestedData['seoDescription'],
            image: await nestedData['image']['main'], 
          );

          emit(state.copyWith(news_info: fetched_dataInfo));
      
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
