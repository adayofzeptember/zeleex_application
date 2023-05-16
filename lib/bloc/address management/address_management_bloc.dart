import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/bloc/address%20management/model.dart';

import '../../API/Post Method/address_add_and_edit.dart';
import '../../Others/url.dart';
import 'model.dart';
import 'model.dart';
part 'address_management_event.dart';
part 'address_management_state.dart';

class AddressManagementBloc
    extends Bloc<AddressManagementEvent, AddressManagementState> {
  final dio = Dio();
  AddressManagementBloc()
      : super(AddressManagementState(address_switch: false, ifDeafult: 0)) {
    on<TapSwitchAddress>((event, emit) {
      emit(state.copyWith(address_switch: event.getBooleanSwitch));

      if (state.address_switch == true) {
        emit(state.copyWith(ifDeafult: 1));
      } else {
        emit(state.copyWith(ifDeafult: 0));
      }
    });

    on<AddNew_Address>((event, emit) async {
      SharedPreferences prefs2 = await SharedPreferences.getInstance();
      var user_token = prefs2.get('keyToken');
      var user_id = prefs2.get('keyID');

      try {
        final response =
            await dio.post(zeelexAPI_URL_admin + "address/shipping",
                options: Options(
                  headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Bearer $user_token",
                  },
                ),
                data: event.address_request);
        print(response);
        if (response.statusCode == 200) {
        } else {
          print('error not 200');
        }
      } catch (e) {
        print("Exception: $e");
      }
    });
  }
}
