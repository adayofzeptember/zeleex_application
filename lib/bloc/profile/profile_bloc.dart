import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/Others/url.dart';
import 'package:zeleex_application/bloc/profile/model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final dio = Dio();
  ProfileBloc()
      : super(ProfileState(loading: true, profile_data: '')) {
    on<Load_Profile>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('keyToken');
      emit(state.copyWith(loading: true));
      try {
        final response = await dio.get(
          zeelexAPI_URL_admin + "profile",
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }),
        );
        dynamic dataProfile =
            (state.profile_data != '') ? state.profile_data : '';
        dynamic nestedData = response.data['data'];
        if (response.statusCode == 200) {
          emit(state.copyWith(loading: false));
          dataProfile = Profile_Data(
              id: await nestedData['id'].toString(),
              name: await nestedData['name'],
              image: await nestedData['avatar']);

          emit(state.copyWith(
            profile_data: dataProfile,
          ));
        } else {
          print('-----------fail api');
          print(response);
          emit(state.copyWith(loading: false));
        }
      } catch (e) {
        emit(state.copyWith(loading: false));
        print('----------- fail try');

        print("Exception $e");
      }
    });

    //-


  }
}
